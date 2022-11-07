//
//  OutgoingPort.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import Foundation

enum OutgoingPort: CaseIterable, Codable {
    case port25, port465, port587, portUser
    
    var title: String {
        switch self {
        case .port25:
            return "25"
        case .port465:
            return "465"
        case .port587:
            return "587"
        case .portUser:
            return "Кастом"
        }
    }
}
