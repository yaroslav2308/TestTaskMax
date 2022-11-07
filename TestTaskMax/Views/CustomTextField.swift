//
//  CustomTextField.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    var placeHolder: String
    @Binding var textBinding: String
    var isSecure: Bool
    var isEmail: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title):")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.gray)
            if isSecure {
                SecureField(placeHolder, text: $textBinding)
                    .font(.system(.title3, design: .rounded))
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, -10)
            } else {
                TextField(placeHolder, text: $textBinding)
                    .font(.system(.title3, design: .rounded))
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, -10)
                    .keyboardType(isEmail ? .emailAddress : .default)
            }
            
        }
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField()
//    }
//}
