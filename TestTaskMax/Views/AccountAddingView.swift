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
                ForEach(PostOption.allCases, id: \.self) { option in
                    Button {
                        
                    } label: {
                        optionView(with: option)
                    }
                    .buttonStyle(PlainButtonStyle() )

                }
                Spacer()
            }
        }
        
    }
}

extension AccountAddingView {
    @ViewBuilder
    private func optionView(with option: PostOption) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.15), radius: 4)
                Image(option.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
            }
            .propotionalFrame(width: 0.2, height: 0.06, isSquared: true, accordingToWidth: false)
            Text(option.title)
                .fontWeight(.light)
                .padding(.leading, 5)
            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(.gray, lineWidth: 0.5, antialiased: false)))
        .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
    }
    
}

struct AccountAddingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountAddingView()
    }
}
