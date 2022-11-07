//
//  MessageOfIncorrectness.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct MessageOfIncorrectnessView: View {
    var body: some View {
        Text("Заполните все необходимые поля")
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
    }
}

struct MessageOfIncorrectness_Previews: PreviewProvider {
    static var previews: some View {
        MessageOfIncorrectnessView()
    }
}
