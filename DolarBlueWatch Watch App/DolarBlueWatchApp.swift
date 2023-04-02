//
//  DolarBlueWatchApp.swift
//  DolarBlueWatch Watch App
//
//  Created by Ricardo CORIN on 4/1/23.
//

import SwiftUI

@main
struct DolarBlueWatch_Watch_AppApp: App {
	@StateObject private var modelData = ModelData()

    var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(modelData)
		}
    }
}
