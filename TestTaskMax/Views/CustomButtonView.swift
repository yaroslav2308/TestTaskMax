//
//  NextButtonView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct CustomButtonView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(.headline, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(10)
            .padding(.horizontal, 5)
            .background(RoundedRectangle(cornerRadius: 12).fill())
    }
}

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(title: "Далее")
    }
}
