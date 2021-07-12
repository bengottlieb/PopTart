//
//  PopTarts.Tart.swift
//  
//
//  Created by Ben Gottlieb on 7/12/21.
//

import SwiftUI

public extension PopTarts {
	struct Tart {
		public var title: String
		public var duration: TimeInterval
		
		public var backgroundColor = Color.black
		public var textColor = Color.white
		public var borderColor = Color.white
		public var borderWidth: CGFloat = 2
		public var cornerRadius: CGFloat = 8
		public var titleFont = Font.system(size: 14, weight: .semibold)
		
		
		public init(title: String, duration: TimeInterval = PopTarts.onScreenTime) {
			self.title = title
			self.duration = duration
		}
		
		static let sample = Tart(title: "Look at me!")
	}
}
