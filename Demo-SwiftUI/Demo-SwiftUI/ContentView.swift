//
//  ContentView.swift
//  Demo-SwiftUI
//
//  Created by David on 2023/4/28.
//

import SwiftUI
import ScreenshotPreventingSwiftUI

struct ContentView: View {

    @State private var preventScreenShot = false

    var body: some View {
        VStack {
            ScreenshotPrevent(isProtected: preventScreenShot) {
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
            .screenshotProtected(isProtected: preventScreenShot) // <- view extension

            hintText

            Toggle("", isOn: $preventScreenShot)
                .labelsHidden()
        }
        .padding()
    }

    var hintText: some View {
        Text(preventScreenShot ? "Prevent screen shot" : "No protect")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
