//
//  TextExtension.swift
//  PopularMovies
//
//  Created by Shimaa on 12/2/21.
//

import Foundation
import SwiftUI


extension Text {
    func setUpTextStyle(fontSize: CGFloat = 14, fontWeight: Font.Weight = .regular, foregroundColor: Color = .black, textAlignment: TextAlignment = .center) -> some View {
        self.font(.system(size: fontSize))
            .fontWeight(fontWeight)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(textAlignment)
    }
}

