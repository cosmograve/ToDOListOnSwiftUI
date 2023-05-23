//
//  ToDoListItemViewViewModel.swift
//  ToDOListOnSwiftUI
//
//  Created by Алексей Авер on 21.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    init() {
        
    }
    func toggleIsDone(item: ToDoListItem) {
        var newCopy = item
        newCopy.setDone(!item.isDone)
        
        guard let uID = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
            .collection("users")
            .document(uID)
            .collection("toDos")
            .document(newCopy.id)
            .setData(newCopy.makeDictionary())
    } 
}

