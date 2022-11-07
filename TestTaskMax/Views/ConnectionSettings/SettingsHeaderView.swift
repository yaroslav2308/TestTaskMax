//
//  SettingsHeader.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct SettingsHeaderView: View {
    var headerType: HeaderType
    var body: some View {
        Text("Настроить учетную запись")
            .font(.system(.title2, design: .rounded))
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
        
        Text("Выполните настроку \(headerType.title) \n\(headerType.subTitle)")
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.center)
            .padding(.top, 1)
            .foregroundColor(.gray)
    }
}

enum HeaderType {
    case imap, smtp
    
    var title: String {
        switch self {
        case .imap:
            return "IMAP"
        case .smtp:
            return "SMTP"
        }
    }
    
    var subTitle: String {
        switch self {
        case .imap:
            return "(входящие сообщения по почте)"
        case .smtp:
            return "(исходящая почта)"
        }
    }
}
