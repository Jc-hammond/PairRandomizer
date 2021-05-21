//
//  PersonController.swift
//  Randomizer
//
//  Created by Connor Hammond on 5/21/21.
//

import Foundation
import CoreData

class PersonController {
    
    static var shared = PersonController()
    
    var people: [Person] = []
    
    //Trying to figure out how to create pairs from the "people" array
    //and to poplate the pair1...4 arrays
//    var sections: [[Person]] {[pair1, pair2, pair3, pair4]}
//    var pair1: [Person] = []
//    var pair2: [Person] = []
//    var pair3: [Person] = []
//    var pair4: [Person] = []
    
    private lazy var fetchRequest: NSFetchRequest<Person> = {
        let request = NSFetchRequest<Person>(entityName: "Person")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //Functions
    func createPerson(name: String) {
        let person = Person(name: name)
        people.append(person)
        CoreDataStack.saveContext()
    }
    
    func update(person: Person, name: String) {
        person.name = name
        CoreDataStack.saveContext()
    }
    
    func fetchPerson() {
        let people = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(people.count)
        self.people = people
//        self.pair1 = people
//        self.pair2 = people
//        self.pair3 = people
//        self.pair4 = people
    }
    
    func deletePerson(_ person: Person) {
        guard let personToDelete = people.firstIndex(of: person) else {return}
        people.remove(at: personToDelete)
        CoreDataStack.context.delete(person)
        CoreDataStack.saveContext()
    }
    
    func randomize() {
        people.shuffle()
    }
    
    
} //End of class
