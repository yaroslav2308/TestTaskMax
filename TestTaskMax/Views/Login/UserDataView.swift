//
//  UserDataView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct UserDataView: View {
    @ObservedObject var userDataViewModel: UserDataViewModel
    var body: some View {
        
        CustomTextField(title: "Имя", placeHolder: "Введите имя", textBinding: $userDataViewModel.userData.name, isSecure: false, isEmail: false)
        .padding(.horizontal)
        .padding(.vertical, 10)
        
        CustomTextField(title: "Адрес эл. почты", placeHolder: "Введите почту", textBinding: $userDataViewModel.userData.mail, isSecure: false, isEmail: true)
        .padding(.horizontal)
        .padding(.bottom, 10)
        
        CustomTextField(title: "Пароль", placeHolder: "Введите пароль", textBinding: $userDataViewModel.userData.password, isSecure: true, isEmail: false)
        .padding(.horizontal)
        .padding(.bottom)
    }
}
