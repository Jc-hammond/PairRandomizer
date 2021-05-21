//
//  Pair+Convenience.swift
//  Randomizer
//
//  Created by Connor Hammond on 5/21/21.
//

import CoreData

extension Pair {
    
    @discardableResult convenience init(personOne: String, personTwo: String?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.personOne = personOne
        self.personTwo = personTwo
    }
}
