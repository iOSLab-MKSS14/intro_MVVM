//
//  SportsView.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 23/08/25.
//

import SwiftUI

struct SportsView: View {
	
	@ObservedObject var viewModel: SportsViewModel
	
	init(viewModel: SportsViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		NavigationStack {
			
			List(viewModel.sports) { sport in
				NavigationLink {
					// Pra onde vamos?
					SportDetailView(sport: sport)
				} label: {
					// UI
					HStack {
						Image(systemName: sport.iconName ?? "circle")
						Text(sport.name ?? "sportName")
					}
				}
			}
			
			.navigationTitle("Esportes")
			
			.toolbar {
				ToolbarItem(placement: .primaryAction) {
					Button {
						viewModel.addSports()
					} label: {
						Image(systemName: "plus.circle.fill")
					}
				}
			}
		}
	}
}

#Preview {
	SportsView(viewModel: SportsViewModel(dataManager: DataManager()))
}
