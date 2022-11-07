//
//  UserDataViewModel.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import Foundation

class UserDataViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var incomingServer: String = ""
    @Published var outgoingServer: String = ""
    @Published var incomingPort: IncomingPort = .port143
    @Published var outgoingPort: OutgoingPort = .port25
    @Published var incomingSecurity: SecurityProtocolCases = .withoutSecurity
    @Published var outgoingSecurity: SecurityProtocolCases = .withoutSecurity
    @Published var insecureIncomingSSL: Bool = false
    @Published var insecureOutgoingSSL: Bool = false
    @Published var userFolder: String = ""
}
