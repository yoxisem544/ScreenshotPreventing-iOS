//
//  ContentView.swift
//  Demo-SwiftUI
//
//  Created by David on 2023/4/28.
//

import SwiftUI
import ScreenshotPreventingSwiftUI

struct ContentView: View {

    @State private var preventScreenshot = false

    var body: some View {
        VStack {
            ScreenshotPrevent(isProtected: preventScreenshot) {
                Text("Hello")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(12)
            }

            ScrollView {
                ForEach(1...100, id: \.self) { row in
                    Text("Hello \(row)")
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                }
            }
            .screenshotProtected(isProtected: preventScreenshot) // <- view extension

            hintText

            Toggle("", isOn: $preventScreenshot)
                .labelsHidden()
        }
        .padding()
    }

    var hintText: some View {
        Text(preventScreenshot ? "Prevent screen shot" : "No protect")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
