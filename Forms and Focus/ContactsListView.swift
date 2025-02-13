//
// Created for FocusStateRevisited
// by Stewart Lynch on 2022-05-08
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct ContactsListView: View {
    @Environment(Store.self) var store
    @State private var formType: FormType?
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.contacts) { contact in
                    HStack(alignment: .center) {
                        Image(systemName: "person.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.tint)
                        VStack(alignment: .leading) {
                            Text("\(contact.firstName) \(contact.lastName)")
                                .font(.title)
                            Text("\(contact.email)")
                        }
                        Spacer()
                        Button {
                            formType = .update(contact)
                        } label: {
                            Text("Edit")
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .navigationTitle("Contacts")
            .listStyle(.plain)
            .toolbar {
                Button {
                    formType = .new
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title3)
                }
            }
            .sheet(item: $formType) { $0 }
        }
    }
}

#Preview {
    ContactsListView()
        .environment(Store(preview: true))
}
