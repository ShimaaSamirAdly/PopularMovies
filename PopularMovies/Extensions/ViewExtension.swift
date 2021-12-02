//
//  ViewExtension.swift
//  PopularMovies
//
//  Created by Shimaa on 12/2/21.
//

import Foundation
import SwiftUI


extension View {
    func setBackGroundStyle(backgoundColor: Color = .white, cornerRadius: CGFloat = 10.0, shadowRadius: CGFloat = 10.0) -> some View {
        self.background(backgoundColor
                    .cornerRadius(cornerRadius)
                    .shadow(radius: shadowRadius))
    }
}
