//
//  ContactDetailView.swift
//  Navigation
//
//  Created by Rin on 2024/03/24.
//

import SwiftUI
import ComposableArchitecture

struct ContactDetailView: View {
    @Bindable var store: StoreOf<ContactDetailFeature>

    var body: some View {
        Form {
            Button("Delete") {
                store.send(.deleteButtonTapped)
            }
        }
        .navigationBarTitle(Text(store.contact.name))
        .alert($store.scope(state: \.alert, action: \.alert))
    }
}


#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "Blob")
                )
            ) {
                ContactDetailFeature()
            }
        )
    }
}
