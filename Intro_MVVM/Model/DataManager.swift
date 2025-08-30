//
//  DataManager.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 23/08/25.
//

import Foundation
import CoreData

class DataManager: DataManagerProtocol {
		
	// Create Read Update Delete

	let persistentContainer: NSPersistentContainer
	
	var viewContext: NSManagedObjectContext {
		return persistentContainer.viewContext
	}
	
	init() {
		self.persistentContainer = NSPersistentContainer(name: "Models")
		
		persistentContainer.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error)")
			}
		}
	}
	
	func createSport(_ newSport: SportWrapper) -> Result<Sport, Error> {
		do {
			let sport = Sport(context: self.viewContext)
			sport.name = newSport.name
			sport.iconName = newSport.iconName
			sport.sportDescription = newSport.sportDescription
			sport.id = newSport.id
			sport.year = Int16(newSport.year)
			
			try viewContext.save()
			
			return .success(sport)
		} catch {
			return .failure(error)
		}
	}
	
	func fetchSports() -> Result<[Sport], Error> {
		do {
			let request = NSFetchRequest<Sport>(entityName: "Sport")
			
			let result = try viewContext.fetch(request)
			
			return .success(result)
		} catch {
			return .failure(error)
		}
	}
}

protocol DataManagerProtocol {
	func createSport(_ newSport: SportWrapper) -> Result<Sport, Error>
	func fetchSports() -> Result<[Sport], Error>
}
