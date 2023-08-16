//
//  CustomListRowView.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-16.
//

import SwiftUI

struct CustomListRowView: View {
    @State var text: String
    @State var value: String? = nil
    @State var image: String
    @State var color: Color
    @State var linkLabel: String? = nil
    @State var destination: String? = nil
    
    var body: some View {
        LabeledContent{
            if value != nil {
                Text(value!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy )
            }else if(linkLabel != nil && destination != nil){
                Link(linkLabel!, destination: URL(string: destination!)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            }
             else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(color)
                        .frame(width: 30, height: 30)
                    Image(systemName: image)
                        .foregroundStyle(.white)
                }
                Text(text)
            }
        }
    }
}

#Preview {
    List{
        CustomListRowView(text: "WebSite", value: nil, image: "globe", color: .pink, linkLabel: "Vizualink", destination: "https://www.vizualink.com")
    }
}
