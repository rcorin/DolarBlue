//
//  ContentView.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		CotizacionList()
			.environmentObject(ModelData())
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(ModelData())
    }
}
