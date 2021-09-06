//
//  BlankView.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI

struct BlankView: View {
	// MARK: - Properties
	var backgroundColor: Color
	var backgroundOpacity: Double

	// MARK: - Body
	var body: some View {
		VStack {
			Spacer()
		} //: VStack
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
		.background(backgroundColor)
		.opacity(backgroundOpacity)
		.blendMode(.overlay)
		.edgesIgnoringSafeArea(.all)
	}
}

// MARK: - Preview
struct BlankView_Previews: PreviewProvider {
	static var previews: some View {
		BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
			.background(BackgroundImageView())
			.background(backgroundGradient.ignoresSafeArea(.all))
	}
}
