//
//  PopTarts.swift
//  PopTarts
//
//  Created by Ben Gottlieb on 6/27/21.
//

import SwiftUI

public class PopTarts: ObservableObject {
	var tarts: [Tart] = []
	
	@Published var currentTart: Tart?
	weak var nextTartTimer: Timer?
	
	public func pop(tart: Tart) {
		DispatchQueue.main.async {
			self.tarts.append(tart)
			if self.nextTartTimer == nil { self.showNextTart() }
		}
	}
	
	func showNextTart() {
		if currentTart == nil {
			currentTart = tarts.first
			tarts.removeFirst()
		}
	}
	
	func dismissCurrentTart() {
		if currentTart != nil {
			currentTart = nil
		}
		nextTartTimer = Timer.scheduledTimer(withTimeInterval: Self.hideDuration, repeats: false) { _ in
			self.showNextTart()
		}
	}
}

public extension PopTarts {
	static let onScreenTime: TimeInterval = 2
	static let showDuration: TimeInterval = 0.5
	static let hideDuration: TimeInterval = 0.4
}
