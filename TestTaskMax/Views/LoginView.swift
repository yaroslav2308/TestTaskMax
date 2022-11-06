//
//  LoginView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct LoginView: View {
    let mail: MailOption
    @StateObject private var userData = UserDataViewModel()
    
    @State private var isPresentedConnectionSettings = false
    
    init(mail: MailOption){
        UITableView.appearance().backgroundColor = .clear
        self.mail = mail
    }
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("Добавить учетную \nзапись почты IMAP")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Text("Введите данные вашей учетной записи электронной почты, чтобы начать работу.")
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .foregroundColor(.gray)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Имя:")
                            .font(.system(.title3, design: .rounded))
                            .foregroundColor(.gray)
                        TextField("Введите свое имя", text: $userData.name)
                            .font(.system(.title3, design: .rounded))
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, -10)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    VStack(alignment: .leading) {
                        Text("Адрес эл. почты:")
                            .font(.system(.title3, design: .rounded))
                            .foregroundColor(.gray)
                        TextField("Введите почту", text: $userData.mail)
                            .font(.system(.title3, design: .rounded))
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, -10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        Text("Пароль:")
                            .font(.system(.title3, design: .rounded))
                            .foregroundColor(.gray)
                        TextField("Введите пароль", text: $userData.password)
                            .font(.system(.title3, design: .rounded))
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, -10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    Button {
                        if mail == .other {
                            isPresentedConnectionSettings.toggle()
                        }
                    } label: {
                        ZStack {
                            
                            
                            Text("Продолжить")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 12)
                                                .fill())
                        }
                    }
                    .fullScreenCover(isPresented: $isPresentedConnectionSettings) {
                        ConnectionSettingsView(isPresentedConnectionSettings: $isPresentedConnectionSettings)
                    }
                    Spacer()
                }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(mail: .other)
    }
}
