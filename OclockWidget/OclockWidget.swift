//
//  OclockWidget.swift
//  OclockWidget
//
//  Created by 濱貴大 on 2020/12/24.
//  Copyright © 2020 thama. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents




struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    
}

struct OclockWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            GeometryReader { geo in
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width,
                       height: geo.size.height, alignment: .center)
            }
            
            
            HStack(alignment: .center){
                VStack(alignment: .center, spacing: 12.0) {
                    
                    //spacer
               
            
                
        Text(entry.date, style: .time)
                    .fontWeight(.heavy)
            .font(Font.system(size: 31, weight: .semibold, design: .default))
            
            .foregroundColor(.init(red: 0, green: 10, blue: 255))
            
        
          
    .fontWeight(.heavy)
   
                    Text(entry.date, style: .date)
                        .font(Font.system(size: 22, weight: .semibold, design: .default))
                        .foregroundColor(.init(red: 0, green:255, blue: 0))
                        .shadow(radius: 10)
                        .cornerRadius(10.0)
            
                 
                    
            
        //ウィジェットをタップ
            .widgetURL(URL(string: "widget-link://"))
        
                }
                .padding(/*@END_MENU_TOKEN@*/)
                .frame(height: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/)
         //spacer
       
        }
          
        }
    
    }


}

@main
struct OclockWidget: Widget {
    let kind: String = "OclockWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            OclockWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("本日の日付")
        .description("使ってくれてありがとう！")
        
        
        
    //サイズ2種類
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct OclockWidget_Previews: PreviewProvider {
    static var previews: some View {
        OclockWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        
    }
}


