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
		public var body: String?
		public var error: Error?
		
		public var duration: TimeInterval
		
		public var backgroundColor = Color.black
		public var textColor = Color.white
		public var borderColor = Color.white
		public var borderWidth: CGFloat = 2
		public var cornerRadius: CGFloat = 8
		public var titleFont = Font.system(size: 14, weight: .semibold)
		
		
		public init(title: String, body: String? = nil, error: Error? = nil, duration: TimeInterval = PopTarts.onScreenTime) {
			self.title = title
			self.duration = duration
			self.body = error?.localizedDescription ?? body
			self.error = error
		}
		
		static let sample = Tart(title: "Look at me!")
	}
}
