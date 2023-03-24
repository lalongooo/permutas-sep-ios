//
//  MySwiftUIAppApp.swift
//  MySwiftUIApp
//
//  Created by lalongooo on 24/03/23.
//

import SwiftUI

@main
struct MySwiftUIAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
