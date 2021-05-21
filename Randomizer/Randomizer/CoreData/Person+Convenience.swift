//
//  Person+Convenience.swift
//  Randomizer
//
//  Created by Connor Hammond on 5/21/21.
//

import CoreData

extension Person {
    
    @discardableResult convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.id = UUID()
    }
} //End of extension
