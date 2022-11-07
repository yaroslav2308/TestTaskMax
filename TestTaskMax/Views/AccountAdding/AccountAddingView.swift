//
//  AccountAddingView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct AccountAddingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    Text("Добавить учетную \nзапись почты")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    ForEach(MailOption.allCases, id: \.self) { mail in
                        NavigationLink {
                            LoginView(mail: mail)
                        } label: {
                            MailOptionView(mail: mail)
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct AccountAddingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountAddingView()
    }
}
