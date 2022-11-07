//
//  ConnectionSettingsView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct SettingImapFirstView: View {
    @ObservedObject var userDataViewModel: UserDataViewModel
    
    @State private var isPresentedImapSecondView = false
    @State private var isIncorrectUserData = false
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    
                    SettingsHeaderView(headerType: .imap)
                    
                    CustomTextField(title: "Сервер", placeHolder: "mail.npcmax.ru", textBinding: $userDataViewModel.incomingServer, isSecure: false, isEmail: true)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    // Pickers
                    pickerIncomingPort
                    
                    pickerSecurityProtocol
                    
                    ToggleView(insecureSSl: $userDataViewModel.insecureOutgoingSSL)
                        .padding(.horizontal)
                    
                    CustomTextField(title: "Папка пользователя", placeHolder: "", textBinding: $userDataViewModel.userFolder, isSecure: false, isEmail: false)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    // Navigation to next view
                    NavigationLink(destination: SettingImapSecondView(userDataViewModel: userDataViewModel), isActive: $isPresentedImapSecondView) {
                        EmptyView()
                    }
                    
                    // This message is triggered when user didn't paste his data
                    if isIncorrectUserData {
                        MessageOfIncorrectnessView()
                    }
                    
                    // button to move to next view or to trigger MessageOfIncorrectnessView
                    nextButton
                        .padding(9)
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
    
    var nextButton: some View {
        Button {
            if userDataViewModel.incomingServer == "" || userDataViewModel.userFolder == "" {
                withAnimation(.spring()) {
                    isIncorrectUserData = true
                }
            } else {
                withAnimation(.spring()) {
                    isIncorrectUserData = false
                }
                
                isPresentedImapSecondView.toggle()
            }
        } label: {
            CustomButtonView(title: "Далее")
        }
        .padding(.top, 5)
    }
}

struct SettingImapFirstView_Previews: PreviewProvider {
    static var previews: some View {
        SettingImapFirstView(userDataViewModel: UserDataViewModel())
    }
}
