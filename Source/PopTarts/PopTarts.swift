//
//  PopTarts.swift
//  PopTarts
//
//  Created by Ben Gottlieb on 6/27/21.
//

import SwiftUI

public class PopTarts: ObservableObject {
	var tarts: [Tart] = []
	public static let instance = PopTarts()
	
	@Published var currentTart: Tart?
	weak var nextTartTimer: Timer?
	var hostWindow: UIWindow?
	
	private init() {
		
	}
	
	public func setup(in scene: UIWindowScene? = nil) {
		DispatchQueue.main.async {
			self.add(toScene: scene)
		}
	}

	public func pop(tart: Tart) {
		if hostWindow == nil {
			print("#### PopTarts was not successfully set up. Please calld PopTarts.instance.setup(scene:) at init time ###")
			return
		}
		DispatchQueue.main.async {
			self.tarts.append(tart)
			if self.nextTartTimer == nil { self.showNextTart() }
		}
	}
	
	func showNextTart() {
		if currentTart == nil, let next = tarts.first {
			withAnimation(.easeOut(duration: Self.showDuration)) {
				currentTart = next
			}
			DispatchQueue.main.asyncAfter(deadline: .now() + next.duration) {
				self.dismissCurrentTart()
			}
			tarts.removeFirst()
		}
	}
	
	func dismissCurrentTart() {
		if currentTart != nil {
			withAnimation(.easeIn(duration: Self.hideDuration)) {
				currentTart = nil
			}
			nextTartTimer = Timer.scheduledTimer(withTimeInterval: Self.hideDuration, repeats: false) { _ in
				self.showNextTart()
			}
		}
	}
}

public extension PopTarts {
	static let onScreenTime: TimeInterval = 4
	static let showDuration: TimeInterval = 0.5
	static let hideDuration: TimeInterval = 0.4
}
