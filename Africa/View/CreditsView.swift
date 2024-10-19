//
//  CreditsView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 19/10/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
            Copyright © Jozek Hajduk
            All right reserved
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}
