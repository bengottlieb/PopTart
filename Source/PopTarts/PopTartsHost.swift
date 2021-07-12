//
//  PopTartHost.swift
//  
//
//  Created by Ben Gottlieb on 7/12/21.
//

import SwiftUI

public struct PopTartHost: View {
	@Environment(\.popTarts) var popTarts
	
	public init() {
	}
	
	public var body: some View {
		ZStack() {
			Rectangle()
				.fill(Color.clear)
				.edgesIgnoringSafeArea(.all)
			
			if let tart = popTarts.currentTart {
				TartView(tart: tart)
			}
		}
	}
}

struct PopTartHost_Previews: PreviewProvider {
	static let popTarts = PopTarts()
	static var previews: some View {
		ZStack() {
			Color.gray.edgesIgnoringSafeArea(.all)
			PopTartHost()
		}
		.onAppear {
			popTarts.pop(tart: PopTarts.Tart(title: "Good Morning!"))
		}
		.environment(\.popTarts, popTarts)
	}
}
