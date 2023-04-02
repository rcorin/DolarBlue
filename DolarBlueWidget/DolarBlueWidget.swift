//
//  DolarBlueWidget.swift
//  DolarBlueWidget
//
//  Created by Ricardo CORIN on 4/1/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
		SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
		let entry = SimpleEntry(date: Date())
        completion(entry)
    }

	@MainActor func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
		let modelData = ModelData()

		Task {
			await modelData.update()
			
			var entries: [SimpleEntry] = []
			
			let casa = modelData.cotizaciones[0].casa
			let entry = SimpleEntry(date: Date(), casa: casa)
			entries.append(entry)
			
			let timeline = Timeline(entries: entries, policy: .atEnd)
			completion(timeline)
		}
    }
}

struct SimpleEntry: TimelineEntry {
	var date: Date
	
	var casa: Casa?
}

struct DolarBlueWidgetEntryView : View {
    var entry: Provider.Entry
	@EnvironmentObject var modelData: ModelData

    var body: some View {
		let iconSize : CGFloat = 25
		VStack(alignment: .center) {
			Text(entry.casa?.nombre_oficial ?? "")
				.font(.subheadline)
				.fontWeight(.bold)
			
			HStack {
				switch entry.casa?.variacion_sign ?? 0 {
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
					Text(entry.casa?.compra_currency ?? "")
						.font(.title)
						.fontWeight(.ultraLight)
					
					Text(entry.casa?.venta_currency ?? "")
						.font(.title)
						.fontWeight(.ultraLight)
				}
			}
		}
		.frame(maxHeight: .infinity, alignment: .center)

		
    }
}

struct DolarBlueWidget: Widget {
    let kind: String = "DolarBlueWidget"
	@EnvironmentObject var modelData: ModelData

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
			DolarBlueWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Blue Dollar Widget")
        .description("Blue Dollar widget.")
    }
}

struct DolarBlueWidget_Previews: PreviewProvider {
    static var previews: some View {

		DolarBlueWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
