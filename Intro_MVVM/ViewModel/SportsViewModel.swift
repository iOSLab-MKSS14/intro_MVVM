//
//  SportsViewModel.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 23/08/25.
//

import Foundation

class SportsViewModel: ObservableObject {
	
	var dataManager: DataManagerProtocol
	@Published var sports: [Sport] = []
	@Published var errorMessage: String? = nil
	
	init(dataManager: DataManagerProtocol) {
		self.dataManager = dataManager
		
		let result = dataManager.fetchSports()
		
		switch result {
		case .success(let sports):
			self.sports = sports
		case .failure(let error):
			self.errorMessage = error.localizedDescription
		}
	}
	
	func addSports(_ newSport: SportWrapper) {
		let result = dataManager.createSport(newSport)
		
		switch result {
		case .success(let sport):
			print(sport.name ?? "CREATE: sportName")
			self.sports.append(sport)
		case .failure(let error):
			self.errorMessage = error.localizedDescription
		}
	}
	
	func deleteSport(_ sportToDelete: Sport) {
		
		sports.removeAll(where: { $0 == sportToDelete })
		
		let sportName = dataManager.deleteSport(sportToDelete)
	}
}

//[
//	Sport(name: "Futebol", iconName: "soccerball.inverse", description: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus faucibus egestas. Duis ac finibus elit. Maecenas gravida magna dolor. Donec ac convallis felis. Suspendisse potenti. Donec vitae ante porttitor, gravida nisi eu, condimentum nibh. Proin sed fringilla justo. Vivamus placerat bibendum ultrices. Ut efficitur imperdiet euismod. Phasellus et tortor vel lectus consequat consequat ut in nisi. Fusce ultricies metus quis purus sodales, fermentum aliquet est pretium. Proin nisl odio, pharetra vehicula pretium id, lacinia ut justo. Suspendisse ut dignissim justo. Aenean maximus ante lacus. Vestibulum vehicula, lacus nec ultrices ullamcorper, erat massa elementum lorem, eget semper mauris tellus vel arcu.", year: 1863),
//	Sport(name: "Vôlei", iconName: "volleyball.fill", description: "Amo volei", year: 1895),
//	Sport(name: "Vôlei", iconName: "volleyball.fill", description: "Amo volei", year: 1895),
//	Sport(name: "Vôlei", iconName: "volleyball.fill", description: "Amo volei", year: 1895),
//	Sport(name: "Vôlei", iconName: "volleyball.fill", description: "Amo volei", year: 1895),
//	Sport(name: "Vôlei", iconName: "volleyball.fill", description: "Amo volei", year: 1895),
//]
