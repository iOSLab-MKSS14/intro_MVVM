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
	
	@State var newSportsViewIsPresented: Bool = false
	
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
				.swipeActions {
					Button(role: .destructive) {
						viewModel.deleteSport(sport)
					} label: {
						Image(systemName: "trash")
					}
				}
			}
			
			
			.sheet(isPresented: $newSportsViewIsPresented) {
				NewSportsView(viewModel: self.viewModel)
					.interactiveDismissDisabled()
					.presentationDetents([.medium, .large])
			}
			
			.navigationTitle("Esportes")
			
			.toolbar {
				ToolbarItem(placement: .primaryAction) {
					Button {
						newSportsViewIsPresented.toggle()
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
