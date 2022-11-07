//
//  ConnetctionSettingsSecondView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct SettingSmtpFirstView: View {
    @ObservedObject var userDataViewModel: UserDataViewModel
    
    @State private var isPresentedSmtpSecondView = false
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
                        .padding(.bottom, 10)
                        .padding(.top, 5)
                    
                    pickerOutgoingPort
                    
                    pickerSecurityProtocol
                    
                    ToggleView(insecureSSl: $userDataViewModel.insecureIncomingSSL)
                        .padding(.horizontal)
                    
                    // Navigation to next view
                    NavigationLink(destination: SettingSmtpSecondView(userDataViewModel: userDataViewModel), isActive: $isPresentedSmtpSecondView) {
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
    
    var nextButton: some View {
        Button {
            if userDataViewModel.outgoingServer == "" {
                withAnimation(.spring()) {
                    isIncorrectUserData = true
                }
            } else {
                withAnimation(.spring()) {
                    isIncorrectUserData = false
                }
                
                isPresentedSmtpSecondView.toggle()
            }
        } label: {
            CustomButtonView(title: "Далее")
        }
        .padding(.top, 5)
    }
}

//struct ConnetctionSettingsSecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConnetctionSettingsSecondView()
//    }
//}
