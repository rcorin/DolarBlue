//
//  CotizacionList.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import SwiftUI

struct CotizacionList: View {
	@EnvironmentObject var modelData: ModelData

	var body: some View {
		NavigationView {
			List {
				HStack {
					Text(modelData.fetchedWhen)
						.font(.footnote)
				}
				ForEach(modelData.cotizaciones, id:\.casa) { cotizacion in
					NavigationLink {
						CotizacionDetail(casa: cotizacion.casa)
					} label: {
						CotizacionRow(casa: cotizacion.casa)
					}
				}
			}
			.listStyle(PlainListStyle())
			.navigationTitle(NSLocalizedString("Price", comment: ""))
			.task {
				await modelData.update()
			}
			.refreshable {
				await modelData.update()
			}
		}
	}
}

struct CotizacionList_Previews: PreviewProvider {
    static var previews: some View {
		CotizacionList()
			.environmentObject(ModelData())
    }
}
