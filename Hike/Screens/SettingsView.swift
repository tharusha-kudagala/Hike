//
//  SettingsView.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-16.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-Search",
        "AppIcon-Map",
        "AppIcon-Campfire",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack"
    ]
    
    var body: some View {
        List{
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80))
                        .fontWeight(.black)
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66))
                            .fontWeight(.black)
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80))
                        .fontWeight(.black)
                    Spacer()
                }.foregroundStyle(
                    LinearGradient(colors: [.colorGreenLight, .colorGreenMedium, .colorGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Where can you find \nPerfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }.multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
            }.listRowSeparator(.hidden)
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                                Button{
                                    UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
                                        error in
                                        if error != nil{
                                            print("Error occured: \(String(describing: error?.localizedDescription))")
                                        }else{
                                            print("Icon changed successfully")
                                        }
                                    }
                                }label: {
                                    Image("\(alternateAppIcons[item])-Preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(16)
                                }.buttonStyle(.borderless)
                        }
                    }
                }.padding(.top, 12)
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
            }.listRowSeparator(.hidden)
            
            Section(header: Text("About the App"),
                    footer: HStack{
                Spacer()
                Text("Copyright All rights reserved.")
                Spacer()
            }.padding(.vertical, 8)) 
            {
                CustomListRowView(text: "Application", value: "Hike", image: "apps.iphone", color: .blue)
                CustomListRowView(text: "Compatibility", value: "iOS, iPadOs", image: "info.circle", color: .red)
                CustomListRowView(text: "Technology", value: "Swift", image: "swift", color: .orange)
                CustomListRowView(text: "Version", value: "1.0", image: "gear", color: .purple)
                CustomListRowView(text: "Developer", value: "Tharusha Kudagala", image: "ellipsis.curlybraces", color: .mint )
                CustomListRowView(text: "Designer", value: "John Doe", image: "paintpalette", color: .pink)
                CustomListRowView(text: "Website", value: nil, image: "globe", color: .purple, linkLabel: "Vizualink", destination: "https://www.vizualink.com")
            }
        }
    }
}

#Preview {
    SettingsView()
}
