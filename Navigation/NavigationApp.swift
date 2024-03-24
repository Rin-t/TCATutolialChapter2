//
//  NavigationApp.swift
//  Navigation
//
//  Created by Rin on 2024/03/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct NavigationApp: App {
    
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
    }

    var body: some Scene {
        WindowGroup {
            ContactsView(store: NavigationApp.store)
        }
    }
}
