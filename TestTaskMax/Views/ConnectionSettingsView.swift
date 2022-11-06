//
//  ConnectionSettingsView.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import SwiftUI

struct ConnectionSettingsView: View {
    @Binding var isPresentedConnectionSettings: Bool
    
    var body: some View {
        Button {
            isPresentedConnectionSettings.toggle()
        } label: {
            Text("dissmiss")
        }

    }
}

struct ConnectionSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionSettingsView(isPresentedConnectionSettings: .constant(true))
    }
}
