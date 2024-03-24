//
//  AddContentView.swift
//  Navigation
//
//  Created by Rin on 2024/03/24.
//

import SwiftUI
import ComposableArchitecture

struct AddContentView: View {

    @Bindable var store: StoreOf<AddContactFeature>

    var body: some View {
        Form {
            TextField("Name", text: $store.contact.name.sending(\.setName))

            Button("Save") {
                store.send(.saveButtonTapped)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Cancel") {
                    store.send((.cancelButtonTapped))
                }
            }
        }
    }
}

#Preview {
  NavigationStack {
      AddContentView(
      store: Store(
        initialState: AddContactFeature.State(
          contact: Contact(
            id: UUID(),
            name: "Blob"
          )
        )
      ) {
        AddContactFeature()
      }
    )
  }
}
