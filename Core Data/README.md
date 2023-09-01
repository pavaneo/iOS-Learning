# iOS-Learning

## Core Data:

Core Data is an object graph and persistence framework provided by Apple in the macOS and 
iOS operating systems. It was introduced in Mac OS X 10.4 Tiger and iOS with iPhone SDK 
3.0. It allows data organized by the relational entity–attribute model to be serialized 
into XML, binary, or SQLite stores.

Core Data isn’t a database.

## Differences Between SQLite and Core Data:

SQLite:

* Have Data Constrains feature.
* Operates on data, stored on disk.
* Can Drop table and Edit data without loading them in memory.
* Slow as compared to core data.

Core Data:

* Don’t have Data Constraints,if required need to implement by business logic.
* Operates on in memory.(data needs to be loaded from disk to memory)
* Need to load entire data if we need to drop table or update.
* Fast in terms of record creation.(saving them may be time consuming)


## NSManagedObject:

Every NSManagedObject instance has a number of properties that tell Core Data about the 
model object. The properties that interest us most are entity and managedObjectContext.
All they seem to do is manage a collection of key-value pairs

## NSManagedObjectContext:

A managed object should always be associated with a managed object context. There are no 
exceptions to this rule. Remember that a managed object context manages a number of records 
or managed objects

## Attribute:

Attributes store the values of a Core Data record.

## Entity:

Every managed object has an entity description, an instance of the NSEntityDescription 
class. The entity description is accessible through the entity property.


## Delete Rules:

- Nullify
- Cascade
- Deny
- No Action


The default for entity relationships deletion rule is None.  It may or may not what you
want depending on how you want the app to behave.  A deeper understanding on how these
rules work may help you implement the correct behavior of your app and in some cases
simplify the removal process of a record.
