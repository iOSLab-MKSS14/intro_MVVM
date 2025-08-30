//
//  SportDetailView.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 23/08/25.
//

import SwiftUI

struct SportDetailView: View {
	
	let sport: Sport
	
	var body: some View {
		VStack {
			
			HStack(alignment: .center, spacing: 0) {
				Image(systemName: sport.iconName ?? "circle")
					.font(.system(size: 150))
				
				Text(String(sport.year))
			}
			.padding(.bottom)
			
			Text(sport.sportDescription ?? "sportDescription")
				.padding(.horizontal)
			
			.navigationTitle(sport.name ?? "sportName")
		}
	}
}


