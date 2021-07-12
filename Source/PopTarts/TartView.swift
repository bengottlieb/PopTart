//
//  TartView.swift
//  
//
//  Created by Ben Gottlieb on 7/12/21.
//

import SwiftUI

struct TartView: View {
	let tart: PopTarts.Tart
	var body: some View {
		ZStack(alignment: .top) {
			Text(tart.title)
				.padding()
				.foregroundColor(tart.textColor)
				.background(backgroundView)
		}
		.frame(maxHeight: .infinity, alignment: .top)
	}
	
	var backgroundView: some View {
		ZStack() {
			RoundedRectangle(cornerRadius: tart.cornerRadius)
				.fill(tart.backgroundColor)
			RoundedRectangle(cornerRadius: tart.cornerRadius)
				.stroke(tart.borderColor, lineWidth: tart.borderWidth)
		}
	}
}

struct TartView_Previews: PreviewProvider {
	static var previews: some View {
		ZStack() {
			Color.gray.edgesIgnoringSafeArea(.all)
			TartView(tart: .sample)
		}
	}
}
