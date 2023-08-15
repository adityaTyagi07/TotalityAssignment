//
//  TotalityProjectApp.swift
//  TotalityProject
//
//  Created by Aditya Tyagi on 09/08/23.
//

import SwiftUI

@main
struct TotalityProjectApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                ContentView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
