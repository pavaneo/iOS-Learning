//
//  LessonTableViewController.swift
//  Keystone Park
//
//  Created by Pavan Kumar J on 27/08/23.
//

import UIKit
import CoreData

class LessonTableViewController: UITableViewController {
    
    // MARK: - Public properties
    var moc: NSManagedObjectContext? {
        didSet {
            if let moc = moc {
                lessonService = LessonService(moc: moc)
            }
        }
    }
    
    // MARK: - Private properties
    
    private var lessonService: LessonService?
    private var studentList = [Student]()
    private var studentToUpdate: Student?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadStudents()
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print("Core Data Path: \(paths[0])")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = studentList[indexPath.row].name
        cell.detailTextLabel?.text = studentList[indexPath.row].lesson?.type
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentToUpdate = studentList[indexPath.row]
        present(alertController(actionType: "update"), animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lessonService?.delete(student: studentList[indexPath.row])
            studentList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }
}


extension LessonTableViewController {
    @IBAction func addStudentAction(_ sender: Any) {
        present(alertController(actionType: "add"), animated: true)
    }
    
    private func alertController(actionType: String) -> UIAlertController {
        let alertController = UIAlertController(title: "Key stone park lesson", message: "Student Info", preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Name"
            textField.text = self.studentToUpdate == nil ? "" : self.studentToUpdate?.name
        }
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Lesson Type: Ski | Snowboard"
            textField.text = self.studentToUpdate == nil ? "" : self.studentToUpdate?.lesson?.type
        }
        let defaultAction = UIAlertAction(title: actionType.uppercased(), style: .default) { [weak self] (action) in
            guard let strongSelf = self else { return }
            guard let studentName = alertController.textFields?[0].text, let lesson = alertController.textFields?[1].text else {
                return
            }
            if actionType.caseInsensitiveCompare("add") == .orderedSame {
                if let lessonType = LessonType(rawValue: lesson.lowercased()) {
                    strongSelf.lessonService?.addStudent(name: studentName, for: lessonType, completion: { success, students in
                        if success {
                            strongSelf.studentList = students
                        }
                    })
                }
            } else {
                guard let name = alertController.textFields?.first?.text, !name.isEmpty,
                      let studentToUpdate = strongSelf.studentToUpdate,
                      let lessonType = alertController.textFields?[1].text else {
                    return
                }
                strongSelf.lessonService?.update(currentStudent: studentToUpdate, withName: name, forLesson: lessonType)
                strongSelf.studentToUpdate = nil
            }
            DispatchQueue.main.async {
                strongSelf.loadStudents()
            }
        }
        let canceltAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            self.studentToUpdate = nil
        }
        alertController.addAction(defaultAction)
        alertController.addAction(canceltAction)
        return alertController
    }
    
    private func loadStudents() {
        if let students = lessonService?.getAllStudents() {
            studentList = students
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLesson" {
            let destination = segue.destination as! LessonDetailTableViewController
            destination.moc = moc
        }
    }
}
