//
//  PopTartHost.swift
//  
//
//  Created by Ben Gottlieb on 7/12/21.
//

import SwiftUI

struct PopTartHost: View {
	@ObservedObject var popTarts = PopTarts.instance
	
	var body: some View {
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
	static var previews: some View {
		ZStack() {
			Color.gray.edgesIgnoringSafeArea(.all)
		}
		.onAppear {
			PopTarts.instance.pop(tart: PopTarts.Tart(title: "Good Morning!"))
		}
	}
}
