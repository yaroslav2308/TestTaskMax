//
//  SecurityOption.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import Foundation

enum SecurityProtocolCases: CaseIterable {
    case sslTls, startTls, withoutSecurity
    
    var title: String {
        switch self {
        case .sslTls:
            return "SSL/TLS"
        case .startTls:
            return "STARTTLS"
        case .withoutSecurity:
            return "Нет"
        }
    }
}
