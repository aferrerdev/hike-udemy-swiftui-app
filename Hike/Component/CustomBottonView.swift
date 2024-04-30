//
//  CustomBottonView.swift
//  Hike
//
//  Created by Alex Ferrer on 29/4/24.
//

import SwiftUI

struct CustomBottonView: View {
    var body: some View {
        ZStack {
            Circle().fill(
                LinearGradient(
                    colors: [
                        .white,
                        .customGreenLight,
                        .customGreenMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            Circle().stroke(
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                lineWidth: 4
            )
            
            Image(systemName: "figure.hiking")
                .font(.system(size: 30))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium], 
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }.frame(width: 58, height: 58)
    }
}

#Preview {
    CustomBottonView().previewLayout(.sizeThatFits).padding(10)
}
