//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI

struct BackgroundImageView: View {
	// MARK: - Body
	var body: some View {
		Image("rocket")
			.antialiased(true)
			.resizable()
			.scaledToFill()
			.ignoresSafeArea(.all)
	}
}

// MARK: - Preview
struct BackgroundImageView_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundImageView()
	}
}
