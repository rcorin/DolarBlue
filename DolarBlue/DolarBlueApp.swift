//
//  DolarBlueApp.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import SwiftUI

@main
struct DolarBlueApp: App {
	@StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
			ContentView()
				.environmentObject(modelData)

        }
    }
}
