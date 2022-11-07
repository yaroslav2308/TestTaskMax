//
//  UserData.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import Foundation

struct UserData: Codable {
    var name: String = ""
    var mail: String = ""
    var password: String = ""
    var incomingServer: String = ""
    var outgoingServer: String = ""
    var incomingPort: IncomingPort = .port143
    var outgoingPort: OutgoingPort = .port25
    var incomingSecurity: SecurityProtocolCases = .withoutSecurity
    var outgoingSecurity: SecurityProtocolCases = .withoutSecurity
    var insecureIncomingSSL: Bool = false
    var insecureOutgoingSSL: Bool = false
    var userFolder: String = ""
}
