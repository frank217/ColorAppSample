//
//  DropDownView.swift
//  Colour Wheel
//
//  Created by Dang Jun We on 8/5/20.
//  Copyright © 2020 Christian Privitelli. All rights reserved.
//

import SwiftUI

struct ColorModeText : Identifiable {
    var id = UUID()
    var mode: String
}

struct DropDownView: View {
    @State var expand = false
    @Binding var colorMode : String
    let colorModeList: [ColorModeText] = [
        ColorModeText(mode: "monochrome"),
        ColorModeText(mode: "monochrome-dark"),
        ColorModeText(mode: "monochrome-light"),
        ColorModeText(mode: "analogic"),
        ColorModeText(mode: "complement"),
        ColorModeText(mode: "analogic-complement"),
        ColorModeText(mode: "triad"),
        ColorModeText(mode: "quad")]
    
    var body : some View {
        ScrollView(.vertical) {
            VStack{
                HStack{
                    Text(colorMode).fontWeight(.heavy)
                    
                }.onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    ForEach(colorModeList ) { color in
                        Button(action: {
                            self.colorMode = color.mode
                            self.expand.toggle()
                        }){
                            Text(color.mode).padding()
                        }.foregroundColor(.black)
                    }
                }
                
            }
            .padding(7)
            .background(expand ? Color.green :  Color.blue)
            .cornerRadius(20)
            .animation(.spring())
        }
            
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView(expand:false, colorMode: .constant("initial"))
    }
}
