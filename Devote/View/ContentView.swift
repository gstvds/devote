//
//  ContentView.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
	// MARK: - Properties
	@State var task: String = ""
	
	// MARK: - Fetch Data
	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	
	// MARK: - Functions
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { items[$0] }.forEach(viewContext.delete)
			
			do {
				try viewContext.save()
			} catch {
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
	
	// MARK: - Body
	var body: some View {
		NavigationView {
			ZStack {
				VStack {
					
					
					List {
						ForEach(items) { item in
							VStack(alignment: .leading) {
								Text(item.task ?? "")
									.font(.headline)
									.fontWeight(.bold)
								Text("Item at \(item.timestamp!, formatter: itemFormatter)")
									.font(.footnote)
									.foregroundColor(.gray)
							} //: VStack
						} //: ForEach
						.onDelete(perform: deleteItems)
					} //: List
					.listStyle(InsetGroupedListStyle())
					.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
					.padding(.vertical, 0)
					.frame(maxWidth: 640)
				} //: VStack
			} //: ZStack
			.onAppear() {
				UITableView.appearance().backgroundColor = UIColor.clear
			} //: onAppear
			.navigationBarTitle("Daily Tasks", displayMode: .large)
			.toolbar {
				#if os(iOS)
				ToolbarItem(placement: .navigationBarTrailing) {
					EditButton()
				} //: ToolbarItem
				#endif
			} //: toolbar
			.background(
				BackgroundImageView()
			) //: background
			.background(
				backgroundGradient.ignoresSafeArea(.all)
			) //: background
		} //: NavigationView
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
