//
//  ContentView.swift
//  Navigation
//
//  Created by Rin on 2024/03/23.
//

import SwiftUI
import ComposableArchitecture

struct ContactsView: View {

    @Bindable var store: StoreOf<ContactsFeature>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List {
                ForEach(store.contacts) { contact in
                    HStack {
                        Text(contact.name)
                        Spacer()
                        Button {
                            store.send(.delegateButtonTapped(id: contact.id))
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button {
                        store.send(.addButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        } destination: { store in
            ContactDetailView(store: store)
        }
        .sheet(
            item: $store.scope(state: \.destination?.addContact, action: \.destination.addContact)
        ) { addContactStore in
            NavigationStack {
                AddContentView(store: addContactStore)
            }
        }
        .alert($store.scope(state: \.destination?.alert, action: \.destination.alert))
    }
}


#Preview {
    ContactsView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Blob"),
                    Contact(id: UUID(), name: "Blob Jr"),
                    Contact(id: UUID(), name: "Blob Sr"),
                ]
            )
        ) {
            ContactsFeature()
        }
    )
}
