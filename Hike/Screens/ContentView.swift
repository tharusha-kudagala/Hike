//
//  ContentView.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-13.
//

import SwiftUI

struct ContentView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isSheetShow:Bool = false
    
    func RandomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack{
            CustomBackgroundView()
            VStack(alignment: .center){
                ZStack{
                    HStack{
                        Text("Hiking")
                            .foregroundStyle(
                                LinearGradient(colors: [Color(.colorGrayLight), Color(.colorGrayMedium)], startPoint: .top, endPoint: .bottom))
                            .font(.system(size: 52))
                            .fontWeight(.black)
                            .padding(.horizontal, 23)
                        Spacer()
                        ZStack{
                            Circle()
                                .fill(LinearGradient(colors: [.customLightGreen, .customDarkGreen], startPoint: .top, endPoint: .bottom))
                                .stroke(LinearGradient(colors: [Color(.colorGrayLight), Color(.colorGrayMedium)], startPoint: .top, endPoint: .bottom), lineWidth: 4)
                                .frame(width: 60)
                            Button(action: {
                                isSheetShow.toggle()
                            }, label: {
                                Image(systemName: "figure.hiking")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(LinearGradient(colors: [Color(.colorGrayLight), Color(.colorGrayMedium)], startPoint: .top, endPoint: .bottom))
                                    .frame(width: 20)
                            }).sheet(isPresented: $isSheetShow, content: {
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium, .large])
                            })
                        }
                        Spacer()
                    }
                }
                Text("Fun and enjoyable outdoor activity for friends and families.")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(Color(.colorGrayMedium))
                    .padding(.horizontal, 10)
                ZStack{
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                    }
                Button {
                    RandomImage()
                } label: {
                    Text("Explore More")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.colorGreenLight, .colorGreenDark], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                } .buttonStyle(ButtonGradient())
                }
            }.frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 300)
    }
}

#Preview {
    ContentView()
}
