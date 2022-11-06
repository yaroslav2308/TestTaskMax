//
//  PostOption.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import Foundation

enum PostOption: CaseIterable {
    case mailRu, yandex, gmail, office, outlook, iCloud, other
    
    var title: String {
        switch self {
        case .mailRu:
            return "Mail.RU"
        case .yandex:
            return "Yandex"
        case .gmail:
            return "Gmail"
        case .office:
            return "Office 365"
        case .outlook:
            return "Outlook.com / Hotmail"
        case .iCloud:
            return "iCloud"
        case .other:
            return "Другая почта"
        }
    }
    
    var imageName: String {
        switch self {
        case .mailRu:
            return "mailRuImage"
        case .yandex:
            return "yandexImage"
        case .gmail:
            return "gmailImage"
        case .office:
            return "officeImage"
        case .outlook:
            return "outlookImage"
        case .iCloud:
            return "iCloudImage"
        case .other:
            return "otherImage"
        }
    }
}
