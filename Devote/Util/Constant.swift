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
