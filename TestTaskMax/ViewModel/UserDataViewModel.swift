//
//  UserDataViewModel.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import Foundation

class UserDataViewModel: ObservableObject {
//    @Published var name: String = ""
//    @Published var mail: String = ""
//    @Published var password: String = ""
//    @Published var incomingServer: String = ""
//    @Published var outgoingServer: String = ""
//    @Published var incomingPort: IncomingPort = .port143
//    @Published var outgoingPort: OutgoingPort = .port25
//    @Published var incomingSecurity: SecurityProtocolCases = .withoutSecurity
//    @Published var outgoingSecurity: SecurityProtocolCases = .withoutSecurity
//    @Published var insecureIncomingSSL: Bool = false
//    @Published var insecureOutgoingSSL: Bool = false
//    @Published var userFolder: String = ""
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
