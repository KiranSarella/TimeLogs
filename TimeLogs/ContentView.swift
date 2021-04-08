//
//  ContentView.swift
//  TimeLogs
//
//  Created by Kiran on 01/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var business = TimeLogsBusiness()
    
    var body: some View {
        
        VStack {
            InputLogView(business: business)
                .padding()
            List {
                ForEach(business.dayLogs) { dayLog in
                    Section(header:
                        HeaderView(dayLog: dayLog, business: business)
                                
                    ) {
                        ForEach(dayLog.timeLogs) { timeLog in
                            HStack(alignment: .top) {
                                
                                Text(timeLog.getTimeFormatted())
                                    .frame(width: 70, alignment: .leading)
                                    .foregroundColor(Color.gray)
                                    .font(Font.custom("ComicSansMS", size: 10))
                                
                                Text(timeLog.task)
                                    .font(Font.custom("ComicSansMS", size: 14))
                                
                                Button(action: {
                                    // copy to pasteboard
                                    NSPasteboard.general.clearContents()
                                    _ = NSPasteboard.general.setString(timeLog.task , forType: .string)
                                    
                                }) {
                                    Image(systemName: "doc.on.doc")
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        
        
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding(8)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(12.0)
    }
    
}

struct HeaderView: View {

    @State var dayLog: DayLog
    let business: TimeLogsBusiness

    var body: some View {

        HStack {
            Text(dayLog.getHeading()).font(.system(size: 20))
            Spacer()
            Button("Clear") {
                business.removeLogsSection(dayLog)
            }
        }
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct InputLogView: View {
    
    let business: TimeLogsBusiness
    
    @State var log: String = ""
    
    var body: some View {
        HStack {
            TextEditor(text: $log)
                .frame(height: 80)
                .font(Font.custom("ComicSansMS", size: 18))
            Spacer()
            Button("Add") {
                
                // append to today section logs
                business.addTimeLog(log)
                
                // clear field
                log = ""
            }
        }
    }
}


