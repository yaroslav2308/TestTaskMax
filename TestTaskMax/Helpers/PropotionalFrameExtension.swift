//
//  PropotionalFrameExtension.swift
//  TestTaskMax
//
//  Created by Yaroslav Monastyrev on 06.11.2022.
//

import Foundation
import SwiftUI

// extension to view to make proportional frames on different devices

extension View {
    func propotionalFrame(width: CGFloat, height: CGFloat, isSquared: Bool = false, accordingToWidth: Bool = true) -> some View {
        var finalWidth = UIScreen.main.bounds.width * width
        var finalHeight = UIScreen.main.bounds.height * height
        if accordingToWidth {
            finalHeight = isSquared ? finalWidth : finalHeight
        } else {
            finalWidth = isSquared ? finalHeight : finalWidth
        }
        
        return frame(width: finalWidth, height: finalHeight)
      }
    }
