//
//  SwiftUIView.swift
//  
//
//  Created by Ben Gottlieb on 7/12/21.
//

import SwiftUI

public struct PopTartsKey: EnvironmentKey {
	public static let defaultValue: PopTarts = PopTarts.instance
}

public extension EnvironmentValues {
	var popTarts: PopTarts {
		get { self[PopTartsKey.self] }
		set { self[PopTartsKey.self] = newValue }
	}
}
