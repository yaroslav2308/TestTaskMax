//
//  ToggleView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 07.11.2022.
//

import SwiftUI

struct ToggleView: View {
    @Binding var insecureSSl: Bool
    var body: some View {
        Toggle(isOn: $insecureSSl) {
            Text("Небезопасный SSL")
                .font(.system(.title3, design: .rounded))
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 9)
                        .fill(.white))
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(insecureSSl: .constant(true))
    }
}
