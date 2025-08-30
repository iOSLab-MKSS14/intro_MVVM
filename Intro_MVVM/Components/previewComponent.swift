//
//  previewComponent.swift
//  Intro_MVVM
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 30/08/25.
//

import SwiftUI

struct previewComponent: View {
	
	var iconName: String
	var title: String
	var year: Int
	
	init(iconName: String = "person.fill", title: String = "title", year: Int = 0000) {
		self.iconName = iconName
		self.title = title
		self.year = year
	}
	
	var body: some View {
		HStack {
			Image(systemName: iconName)
			Text(title == "" ? "title" : title)
				.foregroundStyle(title == "" ? .secondary : .primary)
			
			Spacer()
			
			Text("\(year)")
		}
	}
}

#Preview {
	previewComponent()
}
