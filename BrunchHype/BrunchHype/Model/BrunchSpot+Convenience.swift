//
//  BrunchSpot+Convenience.swift
//  BrunchHype
//
//  Created by Bethany Morris on 4/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension BrunchSpot {
    
    convenience init(name: String, summary: String = "No summary added", tier: String = "Unrated", context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.summary = summary
        self.tier = tier
    }
}
