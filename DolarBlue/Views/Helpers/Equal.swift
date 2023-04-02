//
//  TriangleUpShape.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 4/1/23.
//

import SwiftUI

struct EqualShape: View {
	var body: some View {
		GeometryReader { geometry in
			Rectangle()
				.fill(.primary)
				.frame(width: 20 , height: 3, alignment: .center)
				.padding(.top,6)
				.padding(.leading,0)

			Rectangle()
				.fill(.primary)
				.frame(width: 20 , height: 3, alignment: .center)
				.padding(.top,16)
				.padding(.leading,0)

		}
	}
}

struct EqualShape_Previews: PreviewProvider {
    static var previews: some View {
		EqualShape()
    }
}
