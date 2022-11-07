//
//  SettingSmtpSecondView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct SettingSmtpSecondView: View {
    @ObservedObject var userDataViewModel: UserDataViewModel
    
    @State private var isIncorrectUserData = false
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    SettingsHeaderView(headerType: .smtp)
                    
                    CustomTextField(title: "Адрес эл. почты", placeHolder: "Введите почту", textBinding: $userDataViewModel.mail, isSecure: false, isEmail: true)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    CustomTextField(title: "Пароль", placeHolder: "Введите пароль", textBinding: $userDataViewModel.password, isSecure: true, isEmail: false)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    // This message is triggered when user didn't paste his data
                    if isIncorrectUserData {
                        MessageOfIncorrectnessView()
                    }
                    
                    // button to move to next view or to trigger MessageOfIncorrectnessView
                    addAccountButton
                        .padding(9)
                }
            }
        }
    }
}

extension SettingSmtpSecondView {
    var addAccountButton: some View {
        Button {
            if userDataViewModel.mail == "" || userDataViewModel.password == "" {
                withAnimation(.spring()) {
                    isIncorrectUserData = true
                }
            } else {
                withAnimation(.spring()) {
                    isIncorrectUserData = false
                }
            }
        } label: {
            CustomButtonView(title: "Добавить учетную запись")
        }
    }
}

struct SettingSmtpSecondView_Previews: PreviewProvider {
    static var previews: some View {
        SettingSmtpSecondView(userDataViewModel: UserDataViewModel())
    }
}
