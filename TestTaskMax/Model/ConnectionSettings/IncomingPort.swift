//
//  IncomingPort.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import Foundation

enum IncomingPort: CaseIterable, Codable {
    case port143, port993, portUser
    
    var title: String {
        switch self {
        case .port143:
            return "143"
        case .port993:
            return "993"
        case .portUser:
            return "Кастом"
        }
    }
}
