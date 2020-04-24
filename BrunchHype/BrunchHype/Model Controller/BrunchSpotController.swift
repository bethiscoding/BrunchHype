//
//  BrunchSpotController.swift
//  BrunchHype
//
//  Created by Bethany Morris on 4/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class BrunchSpotController {
    
    // MARK: - Singleton
    
    static let shared = BrunchSpotController()
    
    // MARK: - FetchedResults
    
    let fetchedResultsController: NSFetchedResultsController<BrunchSpot>
    
    init() {
        let request: NSFetchRequest<BrunchSpot> = BrunchSpot.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "tier", ascending: true), NSSortDescriptor(key: "name", ascending: true)]
        
        let resultsController: NSFetchedResultsController<BrunchSpot> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "tier", cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch \(error.localizedDescription)")
        }
    }
    
    // MARK: -CRUD Methods
    
    func create(brunchSpotWith name: String) {
        BrunchSpot(name: name)
        saveToPersistence()
    }
    
    func update(brunchSpot: BrunchSpot, name: String, tier: String, summary: String) {
        brunchSpot.name = name
        brunchSpot.tier = tier
        brunchSpot.summary = summary
        saveToPersistence()
    }
    
    func remove(brunchSpot: BrunchSpot) {
        CoreDataStack.context.delete(brunchSpot)
        saveToPersistence()
    }
    
    func saveToPersistence() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an issue with saving MOC, item not saved. \(error.localizedDescription)")
        }
    }
        
} //End of class
