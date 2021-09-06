//
//  Constant.swift
//  Devote
//
//  Created by Gustavo Silva on 06/09/21.
//

import SwiftUI

// MARK: - Formatter
let itemFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateStyle = .short
	formatter.timeStyle = .medium
	return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
	return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX
var feedback = UINotificationFeedbackGenerator()
