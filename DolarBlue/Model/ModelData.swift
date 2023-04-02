//
//  ModelData.swift
//  DolarBlue
//
//  Created by Ricardo CORIN on 3/31/23.
//

import Foundation
import Combine

@MainActor
final class ModelData: ObservableObject {
	@Published var cotizaciones: [Cotizacion] = []
	@Published var isFetching = false
	@Published var fetchedWhen = ""

	func update() async {
		fetchedWhen = NSLocalizedString("Updating...", comment:"")
		isFetching = true
		do {
			cotizaciones = try await fetchDataFromApi().filter { cotiz in
				return cotiz.casa.nombre == "Dolar Blue" || cotiz.casa.nombre == "Dolar Oficial"
			}.reversed()
		} catch {
			print("error")
		}
		
		let date = Date()
		let formatHour = date.getFormattedDate(format: "HH:mm")
		let formatDay  = date.getFormattedDate(format: "dd MMMM")

		fetchedWhen = NSLocalizedString("Updated on {DAY} at {TIME}", comment: "").replacingOccurrences(of: "{TIME}", with: formatHour).replacingOccurrences(of: "{DAY}", with: formatDay)
		isFetching = false
	}
}

func fetchDataFromApi() async throws -> [Cotizacion] {
	guard let url = URL(string: "https://www.dolarsi.com/api/api.php?type=valoresprincipales") else { fatalError("Missing URL") }
	let urlRequest = URLRequest(url: url)
	let (data, response) = try await URLSession.shared.data(for: urlRequest)
	guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
	return try JSONDecoder().decode([Cotizacion].self, from: data)
}

func load<T: Decodable>(_ filename: String) -> T {
	let data: Data

	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
	else {
		fatalError("Couldn't find \(filename) in main bundle.")
	}

	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
	}

	do {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	} catch {
		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
	}
}

extension Date {
   func getFormattedDate(format: String) -> String {
		let dateformat = DateFormatter()
		dateformat.dateFormat = format
		return dateformat.string(from: self)
	}
}
