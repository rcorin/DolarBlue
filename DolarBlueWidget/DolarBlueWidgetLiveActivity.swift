//
//  DolarBlueWidgetLiveActivity.swift
//  DolarBlueWidget
//
//  Created by Ricardo CORIN on 4/1/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DolarBlueWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var value: Int
    }

    var name: String
}

struct DolarBlueWidgetLiveActivity: Widget {
	
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DolarBlueWidgetAttributes.self) { context in
            VStack {
				Text("Blue Dollar")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Blue Dollar")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
				Text("Blue Dollar")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct DolarBlueWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = DolarBlueWidgetAttributes(name: "Me")
    static let contentState = DolarBlueWidgetAttributes.ContentState(value: 3)

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
