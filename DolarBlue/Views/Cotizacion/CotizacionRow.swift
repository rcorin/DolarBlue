//
//  CotizacionRow.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import SwiftUI

struct CotizacionRow: View {
	var casa : Casa
	
    var body: some View {
		let iconSize : CGFloat = 25
			VStack(alignment: .leading) {
				HStack {
					switch casa.variacion_sign {
					case let x where x > 0:
						TriangleUpShape()
							.frame(width: iconSize,height: iconSize,alignment: .center)
					case let x where x < 0:
						TriangleDownShape()
							.frame(width: iconSize,height: iconSize,alignment: .center)
					default:
						EqualShape()
							.frame(width: iconSize,height: iconSize,alignment: .center)
					}
					Text(casa.nombre_oficial)
						.font(.title)
						.fontWeight(.light)
				}
				Text(casa.cotizacion)
					.font(.largeTitle)
					.fontWeight(.heavy)
			}
			Spacer()
	}
	
}

struct CotizacionRow_Previews: PreviewProvider {
	static var cotizaciones = ModelData().cotizaciones

    static var previews: some View {
		Group {
			CotizacionRow(casa: cotizaciones[0].casa)
		}
		.previewLayout(.fixed(width: 340, height: 170))

    }
}
