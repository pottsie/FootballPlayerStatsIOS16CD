//
//  DataController.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import CoreData
import Foundation

final class DataController {
    
    let container: NSPersistentContainer
    var inMemory: Bool = false
    
    init(inMemory: Bool) {
        container = NSPersistentContainer(name: "FootballStatsModel")

        if !inMemory {
            container.loadPersistentStores { description, error in
                if let error = error {
                    print("Error loading persistent stores. \(error.localizedDescription)")
                }
            }
        } else {
            container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
            container.loadPersistentStores { description, error in
                if let error = error {
                    print("Error loading persistent stores. \(error.localizedDescription)")
                }
            }
        }
    }
}
