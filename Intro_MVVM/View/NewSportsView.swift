//
//  NewSportsView.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 30/08/25.
//

import SwiftUI

struct NewSportsView: View {
	
	@ObservedObject var viewModel: SportsViewModel
	
	@Environment(\.dismiss) var dismiss
	
	@State var sportName: String = ""
	@State var sportYear: Int = 2025
	@State var sportIcon: String = "soccerball.inverse"
	
	var iconList: [String] = ["soccerball.inverse", "american.football.fill", "volleyball.fill", "hockey.puck.fill"]
	
	var body: some View {
		NavigationStack {
			
			Form {
				primaryForm
				
				// Preview
				preview
			}
			.navigationTitle("Novo Esporte")
			
			.toolbar {
				// Botões cancelar/concluir
				ToolbarItem(placement: .confirmationAction) {
					confirmButton
				}
				
				ToolbarItem(placement: .cancellationAction) {
					cancelButton
				}
			}
		}
		
		
	}
}

#Preview {
	NewSportsView(viewModel: SportsViewModel(dataManager: DataManager()))
}

extension NewSportsView {
	
	var primaryForm: some View {
		VStack {
			TextField("Nome do esporte", text: $sportName)
			
			Picker(selection: $sportYear) {
				ForEach(1800 ..< 2026) { year in
					Text("\(year)").tag(year)
				}
			} label: {
				Text("Ano")
			}
			.pickerStyle(.wheel)
			
			Picker(selection: $sportIcon) {
				ForEach(iconList, id: \.self) { icon in
					Image(systemName: icon).tag(icon)
				}
			} label: {
				Text("Ícone")
			}
			.pickerStyle(.segmented)
		}
	}
	
	var preview: some View {
		Section {
			previewComponent(iconName: sportIcon, title: sportName, year: sportYear)
		}
	}
	
	var cancelButton: some View {
		Button {
			dismiss()
		} label: {
			Text("Cancelar")
				.foregroundStyle(.red)
				.bold()
		}
	}
	
	var confirmButton: some View {
		Button {
			let newSport = SportWrapper(iconName: sportIcon, name: sportName, sportDescription: "Lorem Ipsum", year: sportYear)
			
			
			viewModel.addSports(newSport)
			
			dismiss()
			
		} label: {
			Text("Concluir")
		}
		.disabled(sportName.isEmpty)
		
	}
	
	
}
