//
//  TriangleUpShape.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 4/1/23.
//

import SwiftUI

struct TriangleDownShape: View {
	var body: some View {
		GeometryReader { geometry in
			Path { path in
				path.move(
					to: CGPoint(
						x: 10,
						y: 23
					)
				)
				path.addLine(to: CGPoint(x:20, y: 3))
				path.addLine(to: CGPoint(x:0, y: 3))
				path.addLine(to: CGPoint(x:10, y: 23))
			}
			.fill(.red)
		}
	}
}

struct TriangleDownShape_Previews: PreviewProvider {
    static var previews: some View {
        TriangleDownShape()
    }
}
