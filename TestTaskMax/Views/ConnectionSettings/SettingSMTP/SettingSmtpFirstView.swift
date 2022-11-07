//
//  ConnetctionSettingsSecondView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct SettingSmtpFirstView: View {
    @ObservedObject var userDataViewModel: UserDataViewModel
    
    @State private var isIncorrectUserData = false
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    
                    SettingsHeaderView(headerType: .smtp)
                    
                    CustomTextField(title: "Сервер", placeHolder: "mail.npcmax.ru", textBinding: $userDataViewModel.outgoingServer, isSecure: false, isEmail: true)
                        .padding(.horizontal)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.01)
                        .padding(.top, UIScreen.main.bounds.height * 0.01 / 2)
                    
                    pickerOutgoingPort
                    
                    pickerSecurityProtocol
                    
                    CustomTextField(title: "Адрес эл. почты", placeHolder: "Введите почту", textBinding: $userDataViewModel.mail, isSecure: false, isEmail: true)
                        .padding(.horizontal)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.01)
                    
                    CustomTextField(title: "Пароль", placeHolder: "Введите пароль", textBinding: $userDataViewModel.password, isSecure: true, isEmail: false)
                        .padding(.horizontal)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.01)
                }
            }
        }
    }
}

extension SettingSmtpFirstView {
    var pickerOutgoingPort: some View {
        VStack(alignment: .leading) {
            Text("Порт:")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.gray)
            Picker("Порт", selection: $userDataViewModel.outgoingPort) {
                ForEach(OutgoingPort.allCases, id: \.self) { port in
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
            Picker("Безопасность", selection: $userDataViewModel.outgoingSecurity) {
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

//struct ConnetctionSettingsSecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConnetctionSettingsSecondView()
//    }
//}
