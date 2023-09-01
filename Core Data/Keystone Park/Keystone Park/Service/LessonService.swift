//
//  LessonService.swift
//  Keystone Park
//
//  Created by Pavan Kumar J on 27/08/23.
//

import Foundation
import CoreData

enum LessonType: String {
    case ski, snowboard
}

typealias StudentHandler = (Bool, [Student]) -> ()

class LessonService {
    private let moc: NSManagedObjectContext
    private var students = [Student]()
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    // MARK: - Public
    
    // CREATE
    func addStudent(name: String, for type:LessonType, completion: StudentHandler) {
        let student = Student(context: moc)
        student.name = name
        
        if let lesson = lessonExist(type) {
            register(student, for: lesson)
            students.append(student)
            completion(true, students)
        }
        
        save()
    }
    
    // READ
    func getAllStudents() -> [Student]? {
        let sortByLesson = NSSortDescriptor(key: "lesson.type", ascending: true)
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.sortDescriptors = [sortByLesson, sortByName]
        do {
            return try moc.fetch(request)
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    // UPDATE
    func update(currentStudent student: Student, withName name: String, forLesson lession: String) {
        //check if student current lesson == new lesson type
        if student.lesson?.type?.caseInsensitiveCompare(lession) == .orderedSame {
            let lesson = student.lesson
            let studentsList = Array(lesson?.students?.mutableCopy() as! NSMutableSet) as! [Student]
            if let index = studentsList.firstIndex(where: { $0 == student }) {
                studentsList[index].name = name
                lesson?.students = NSSet(array: studentsList)
            }
        } else {
            if let lesson = lessonExist(LessonType(rawValue: lession)!) {
                lesson.removeFromStudents(student)
                student.name = name
                register(student, for: lesson)
            }
        }
        save()
    }
    
    // DELETE
    func delete(student: Student) {
        let lesson = student.lesson
        students = students.filter({ $0 != student })
        lesson?.removeFromStudents(student)
        moc.delete(student)
        save()
    }
    
    // MARK: - Private
    
    private func lessonExist(_ type: LessonType) -> Lesson? {
        let request: NSFetchRequest<Lesson> = Lesson.fetchRequest()
        request.predicate = NSPredicate(format: "type = %@", type.rawValue)
        var lesson: Lesson?
        do {
            let result = try moc.fetch(request)
            lesson = result.isEmpty ? addNew(lesson: type) : result.first
        } catch let error {
            print("Error Getting Lesson: \(error.localizedDescription)")
        }
        return lesson
    }
    
    private func addNew(lesson type: LessonType) -> Lesson {
        let lesson = Lesson(context: moc)
        lesson.type = type.rawValue
        return lesson
    }
    
    private func register(_ student: Student, for lesson: Lesson) {
        student.lesson = lesson
    }
    
    private func save() {
        do {
            try moc.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
