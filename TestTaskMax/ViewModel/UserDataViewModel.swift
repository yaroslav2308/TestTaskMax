//
//  UserDataViewModel.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import Foundation

class UserDataViewModel: ObservableObject {
    @Published var userData: UserData = UserData() {
        // save user data every time userData property is updated
        didSet {
            saveUserData()
        }
    }
    
    let userDataKey: String = "userData"
    
    // save user data
    func saveUserData() {
        if let encodedData = try? JSONEncoder().encode(userData) {
            UserDefaults.standard.set(encodedData, forKey: userDataKey)
        }
    }
    
    // get user data
    func getUserData() {
        guard
            let data = UserDefaults.standard.data(forKey: userDataKey),
            let savedUserData = try? JSONDecoder().decode(UserData.self, from: data)
        else { return }
        
        self.userData = savedUserData
        
    }
}
