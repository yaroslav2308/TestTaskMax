//
//  LoginView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct LoginView: View {
    let mail: MailOption
    @StateObject private var userDataViewModel = UserDataViewModel()
    
    @State private var isPresentedConnectionSettings = false
    @State private var isIncorrectUserData = false
    
    @State private var moveLeftRight = 7
    
    init(mail: MailOption){
        UITableView.appearance().backgroundColor = .clear
        self.mail = mail
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    // Header
                    Text("Добавить учетную \nзапись почты IMAP")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Text("Введите данные вашей учетной записи электронной почты, чтобы начать работу.")
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .foregroundColor(.gray)
                    
                    // User data text fields
                    UserDataView(userDataViewModel: userDataViewModel)
                    
                    // Navigation to connection settings view
                    NavigationLink(destination: SettingImapFirstView(userDataViewModel: userDataViewModel), isActive: $isPresentedConnectionSettings) {
                        EmptyView()
                    }
                    
                    // This message is showed when user didn't paste his data
                    if isIncorrectUserData {
                        Text("Заполните все необходимые поля")
                            .font(.system(.body, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    
                    continueButton
                        .padding()
                }
            }
        }
        .onAppear(perform: userDataViewModel.getUserData)
    }
}

extension LoginView {
    var continueButton: some View {
        Button {
            if userDataViewModel.userData.name == "" || userDataViewModel.userData.mail == "" || userDataViewModel.userData.password == "" {
                withAnimation(.spring()) {
                    isIncorrectUserData = true
                }
            } else {
                withAnimation(.spring()) {
                    isIncorrectUserData = false
                }
                if mail == .other {
                    isPresentedConnectionSettings.toggle()
                }
            }
            
        } label: {
            ZStack {
                CustomButtonView(title: "Продолжить")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(mail: .other)
    }
}
