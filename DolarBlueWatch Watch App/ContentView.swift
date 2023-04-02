//
//  ContentView.swift
//  DolarBlueWatch Watch App
//
//  Created by Ricardo CORIN on 4/1/23.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var modelData: ModelData

	var body: some View {
		let casa : Casa? = modelData.cotizaciones.count > 0 ? modelData.cotizaciones[0].casa
		: nil
		let iconSize : CGFloat = 25
		
		VStack(alignment: .leading) {
			Text(casa?.nombre_oficial ?? "")
				.font(.subheadline)
				.fontWeight(.bold)
			
			HStack {
				switch casa?.variacion_sign ?? 0 {
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
				VStack {
					Text(casa?.compra_currency ?? "")
						.font(.title)
						.fontWeight(.ultraLight)
					
					Text(casa?.venta_currency ?? "")
						.font(.title)
						.fontWeight(.ultraLight)
				}
			}
		}
		.frame(maxHeight: .infinity, alignment: .center)
		.task {
		await modelData.update()
		}

		Spacer()
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var cotizaciones = ModelData().cotizaciones
	
    static var previews: some View {
		ContentView()
    }
}
