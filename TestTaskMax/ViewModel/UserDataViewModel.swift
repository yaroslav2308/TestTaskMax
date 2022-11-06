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
}
