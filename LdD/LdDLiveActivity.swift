//
//  LdDLiveActivity.swift
//  LdD
//
//  Created by ehimac on 2024/8/9.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LdDAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LdDLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LdDAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LdDAttributes {
    fileprivate static var preview: LdDAttributes {
        LdDAttributes(name: "World")
    }
}

extension LdDAttributes.ContentState {
    fileprivate static var smiley: LdDAttributes.ContentState {
        LdDAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LdDAttributes.ContentState {
         LdDAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LdDAttributes.preview) {
   LdDLiveActivity()
} contentStates: {
    LdDAttributes.ContentState.smiley
    LdDAttributes.ContentState.starEyes
}
