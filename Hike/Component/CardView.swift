//
//  CardView.swift
//  Hike
//
//  Created by Alex Ferrer on 28/4/24.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        }
        while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    Color.customGrayLight,
                                    Color.customGrayMedium
                            ], startPoint: .top, endPoint: .bottom))
                        Spacer()
                        Button {
                            // ACTION: Show a sheet
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomBottonView()
                        }.sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    Text("Fun and enjoyable outdoor activity for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .fontWeight(.heavy)
                        .foregroundColor(
                            Color.customGrayMedium
                        )
                }.padding(.horizontal, 30) // :HEADER
                
                // MARK: - CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // MARK - FOOTER
                Button {
                    // ACTION: Show a sheet
                    print("Generate a random number")
                    randomImage()
                } label: {
                    Text("Explore more")
                        .tint(.indigo)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.25),
                            radius: 0.25, x: 1, y: 2)
                        
                }.buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    } // CARD
    
}

#Preview {
    CardView()
}
