//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI

struct NewTaskItemView: View {
	// MARK: - Properties
	@AppStorage("isDarkMode") private var isDarkMode: Bool = false
	@Environment(\.managedObjectContext) private var viewContext
	@State private var task: String = ""
	@Binding var isShowing: Bool
	
	private var isButtonDisabled: Bool {
		task.isEmpty
	}
	
	// MARK: - Functions
	private func addItem() {
		withAnimation {
			let newItem = Item(context: viewContext)
			newItem.timestamp = Date()
			newItem.task = task
			newItem.completion = false
			newItem.id = UUID()
			
			do {
				try viewContext.save()
			} catch {
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
			
			task = ""
			hideKeyboard()
			isShowing = false
		}
	}
	
	// MARK: - Body
	var body: some View {
		VStack {
			Spacer()
			
			VStack(spacing: 16) {
				TextField("New Task", text: $task)
					.foregroundColor(.pink)
					.font(.system(size: 24, weight: .bold, design: .rounded))
					.padding()
					.background(
						isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
					) //: background
					.cornerRadius(10)
				
				Button(action: {
					addItem()
				}, label: {
					Spacer()
					Text("Save")
						.font(.system(size: 24, weight: .bold, design: .rounded))
					Spacer()
				}) //: Button
				.disabled(isButtonDisabled)
				.padding()
				.foregroundColor(.white)
				.background(isButtonDisabled ? Color.blue : Color.pink)
				.cornerRadius(10)
			} //: VStack
			.padding(.horizontal)
			.padding(.vertical, 20)
			.background(
				isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
			) //: background
			.cornerRadius(16)
			.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
			.frame(maxWidth: 640)
		} //: VStack
		.padding()
	}
}

// MARK: - Preview
struct NewTaskItemView_Previews: PreviewProvider {
	static var previews: some View {
		NewTaskItemView(isShowing: .constant(true))
			.background(Color.gray.edgesIgnoringSafeArea(.all))
	}
}
