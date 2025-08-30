//
//  Intro_MVVMApp.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 23/08/25.
//

import SwiftUI

@main
struct Intro_MVVMApp: App {
	
	@StateObject var sportsViewModel = SportsViewModel(dataManager: DataManager())
	
	var body: some Scene {
		WindowGroup {
			SportsView(viewModel: sportsViewModel)
		}
	}
}
