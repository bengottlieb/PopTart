//
//  PopTarts.HostWindow.swift
//  
//
//  Created by Ben Gottlieb on 11/24/21.
//

import SwiftUI

extension PopTarts {
	func add(toScene: UIWindowScene?) {
		if hostWindow != nil { return }				 // already added
		guard let scene = toScene ?? firstWindowScene else {
			print("#### Unable to find a window scene, no PopTarts for you! ####")
			return
		}
		
		let window = HostWindow(windowScene: scene)
		window.windowLevel = .statusBar
		window.rootViewController = UIHostingController(rootView: PopTartHost())
		window.rootViewController?.view.backgroundColor = .clear
		window.isHidden = false
		self.hostWindow = window
	}

	var firstWindowScene: UIWindowScene? {
		UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first
	}

	class HostWindow: UIWindow {
		override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
			guard let hitView = super.hitTest(point, with: event) else { return nil }
			return rootViewController?.view == hitView ? nil : hitView
		}
	}
	
}
