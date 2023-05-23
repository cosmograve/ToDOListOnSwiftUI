//
//  ToDoListItemsView.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userID: String) {
        self._items = FirestoreQuery(
            collectionPath:
                "users/\(userID)/toDos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userID))
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "Pf0Fv5HLJmWTbtX3S71SwSuhGpa2")
    }
}
