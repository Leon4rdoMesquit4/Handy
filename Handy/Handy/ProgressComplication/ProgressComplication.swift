//
//  ProgressComplication.swift
//  ProgressComplication
//
//  Created by Caio Marques on 05/06/24.
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

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        for dayOffSet in 0 ..< 7 {
            if let entryDate = Calendar.current.date(byAdding: .day, value: dayOffSet, to: currentDate) {
                let entry = SimpleEntry(date: entryDate)
                entries.append(entry)
            }
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ProgressComplicationEntryView : View {
    var entry: Provider.Entry
    let service = DataService()

    var body: some View {
        ZStack {
            let gradient = LinearGradient(colors: [.brand.opacity(0.5), .brandColor1], startPoint: .bottomLeading, endPoint: .topTrailing)
            Circle()
                .trim(from: 0, to: service.calculateProgress()/100)
                .stroke(
                    style: StrokeStyle(lineWidth: 7, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 50)
                .foregroundStyle(gradient)
        }
        .overlay(alignment: .center) {
            Text("\(Int(service.calculateProgress()))%").font(.headline)
            
        }
    }
}

@main
struct ProgressComplication: Widget {
    let kind: String = "ProgressComplication"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                ProgressComplicationEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ProgressComplicationEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Meu progresso")
        .description("Mostra o progresso do seu tratamento")
        .supportedFamilies([.accessoryCorner,.accessoryCircular])
    }
}

#Preview(as: .accessoryCorner) {
    ProgressComplication()
} timeline: {
    SimpleEntry(date: .now)
}
