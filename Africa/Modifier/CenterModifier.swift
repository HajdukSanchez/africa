//
//  CenterModifier.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 19/10/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
