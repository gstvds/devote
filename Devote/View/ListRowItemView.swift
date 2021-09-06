//
//  ListRowItemView.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI

struct ListRowItemView: View {
	// MARK: - Properties
	@ObservedObject var item: Item
	@Environment(\.managedObjectContext) var viewContext
	
	// MARK: - Body
	var body: some View {
		Toggle(isOn: $item.completion) {
			Text(item.task ?? "")
				.font(.system(.title2, design: .rounded))
				.fontWeight(.heavy)
				.foregroundColor(item.completion ? Color.pink : Color.primary)
				.padding(.vertical, 12)
				.animation(.default)
		} //: Toggle
		.toggleStyle(CheckboxStyle())
		.onReceive(item.objectWillChange, perform: { _ in // objectWillChange is a Publisher parameter. perform is the action that will be triggered after something changes
			if self.viewContext.hasChanges {
				try? self.viewContext.save()
			}
		}) //: onReceive
	}
}
