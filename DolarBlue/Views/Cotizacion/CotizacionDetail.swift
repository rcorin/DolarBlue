//
//  CotizacionDetail.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import SwiftUI

struct CotizacionDetail: View {
	@EnvironmentObject var modelData: ModelData

	var casa: Casa

	var body: some View {
		let billeteHeight : CGFloat = 50
		let screenMiddle = 0.5
		let screen80p = 0.8
		GeometryReader { geometry in
			HStack {
				Spacer()
				Image("p1000")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(height: billeteHeight)
			}
			HStack {
				Spacer()
				Image("p500")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(height: billeteHeight)
			}
			.padding(.top, geometry.size.height*screenMiddle - billeteHeight)
			
			HStack {
				Spacer()
				Image("p200")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(height: billeteHeight)
			}
			.padding(.top, geometry.size.height*screen80p - billeteHeight)

			Rectangle().fill(Color.primary)
				.frame(width: geometry.size.width , height: 2, alignment: .center)
				.padding(.top, geometry.size.height * casa.height - 30)

			Text(casa.cotizacion)
				.font(.title)
				.padding(.top, geometry.size.height * casa.height - 70)
				.padding(.leading, 10)

			}
		.navigationTitle(casa.nombre_oficial)
		.navigationBarTitleDisplayMode(.inline)
	}
}
struct CotizacionDetail_Previews: PreviewProvider {
	static let modelData = ModelData()

	static var previews: some View {
		CotizacionDetail(casa: ModelData().cotizaciones[0].casa)
			.environmentObject(modelData)
	}
}
