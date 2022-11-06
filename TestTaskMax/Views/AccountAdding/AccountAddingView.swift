//
//  AccountAddingView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct AccountAddingView: View {
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Добавить учетную запись почты")
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                ForEach(MailOption.allCases, id: \.self) { option in
                    Button {
                        
                    } label: {
                        MailOptionView(option: option)
                    }
                    .buttonStyle(PlainButtonStyle() )

                }
                Spacer()
            }
        }
        
    }
}

struct AccountAddingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountAddingView()
    }
}
