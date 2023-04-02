//
//  TriangleUpShape.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 4/1/23.
//

import SwiftUI

struct TriangleUpShape: View {
	var body: some View {
		Path { path in
			path.move(
				to: CGPoint(
					x: 10,
					y: 2
				)
			)
			path.addLine(to: CGPoint(x:20, y: 22))
			path.addLine(to: CGPoint(x:0, y: 22))
			path.addLine(to: CGPoint(x:10, y: 2))
		}
		.fill(.green)
	}
}

struct TriangleUpShape_Previews: PreviewProvider {
    static var previews: some View {
        TriangleUpShape()
    }
}
