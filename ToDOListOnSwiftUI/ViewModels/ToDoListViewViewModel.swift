//
//  ToDoListViewViewModel.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {

    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
    }
    /// Delete todo list item
    /// - Parameter id: item to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("toDos")
            .document(id)
            .delete()
        
    }
}
