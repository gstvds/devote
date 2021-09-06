//
//  BlankView.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI

struct BlankView: View {
	// MARK: - Body
	var body: some View {
		VStack {
			Spacer()
			
		} //: VStack
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
		.background(Color.black)
		.opacity(0.5)
		.edgesIgnoringSafeArea(.all)
	}
}

// MARK: - Preview
struct BlankView_Previews: PreviewProvider {
	static var previews: some View {
		BlankView()
	}
}
