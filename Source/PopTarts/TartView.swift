//
//  TartView.swift
//  
//
//  Created by Ben Gottlieb on 7/12/21.
//

import SwiftUI

struct TartView: View {
	@Environment(\.popTarts) var popTarts
	let tart: PopTarts.Tart
	var body: some View {
		ZStack(alignment: .top) {
			Text(tart.title)
				.font(tart.titleFont)
				.padding(.horizontal, 16)
				.padding(.vertical, 8)
				.foregroundColor(tart.textColor)
				.background(backgroundView)
				.padding()
		}
		.frame(maxHeight: .infinity, alignment: .top)
		.transition(.move(edge: .top))
		.zIndex(100)
		.onTapGesture {
			popTarts.dismissCurrentTart()
		}
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
