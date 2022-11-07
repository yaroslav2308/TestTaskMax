//
//  ConnectionSettingsView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct SettingImapFirstView: View {
    @ObservedObject var userDataViewModel: UserDataViewModel
    
    @State private var isPresentedSecondViewSettings = false
    @State private var isIncorrectUserData = false
    
    var body: some View {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        
                        Text("Настроить учетную запись")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        
                        Text("Выполните настроку IMAP \n(входящие сообщения по почте)")
                            .font(.system(.body, design: .rounded))
                            .multilineTextAlignment(.center)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                        
                        CustomTextField(title: "Сервер", placeHolder: "mail.npcmax.ru", textBinding: $userDataViewModel.incomingServer, isSecure: false)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        
                        pickerIncomingPort
                        
                        pickerSecurityProtocol
                        
                        CustomTextField(title: "Адрес эл. почты", placeHolder: "Введите почту", textBinding: $userDataViewModel.mail, isSecure: false)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        CustomTextField(title: "Пароль", placeHolder: "Введите пароль", textBinding: $userDataViewModel.password, isSecure: true)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        CustomTextField(title: "Папка пользователя", placeHolder: "", textBinding: $userDataViewModel.userFolder, isSecure: false)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: ConnectionSettingsSecondView(userDataViewModel: userDataViewModel), isActive: $isPresentedSecondViewSettings) {
                            EmptyView()
                        }
                        
                        // This message is showed when user didn't paste his data
//                        if isIncorrectUserData {
//                            Text("Заполните все необходимые поля")
//                                .font(.system(.body, design: .rounded))
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(.gray)
//                        }
                        
                        Button {
                            isPresentedSecondViewSettings.toggle()
                        } label: {
                            ZStack {
                                Text("Далее")
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 12).fill())
                            }
                        }
                        .padding(.top, 5)

                        
                        
                        
                        
                    }
                }
        }
        

    }
}

extension SettingImapFirstView {
    var pickerIncomingPort: some View {
        VStack(alignment: .leading) {
            Text("Порт:")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.gray)
            Picker("Порт", selection: $userDataViewModel.incomingPort) {
                ForEach(IncomingPort.allCases, id: \.self) { port in
                    Text(port.title).tag(port)
                }
            }
            .pickerStyle(.segmented)
            .padding(.top, -7)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    var pickerSecurityProtocol: some View {
        VStack(alignment: .leading) {
            Text("Безопасность:")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.gray)
            Picker("Безопасность", selection: $userDataViewModel.incomingSecurity) {
                ForEach(SecurityProtocolCases.allCases, id: \.self) { security in
                    Text(security.title).tag(security)
                }
            }
            .pickerStyle(.segmented)
            .padding(.top, -7)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

//struct ConnectionSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConnectionSettingsView(isPresentedConnectionSettings: .constant(true))
//    }
//}
