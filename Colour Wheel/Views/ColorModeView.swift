//
//  ColorModeView.swift
//  Colour Wheel
//
//  Created by Dang Jun We on 8/5/20.
//

import SwiftUI


struct ColorModeView: View {
    @State var colors : [ColorResponse] = []
    @Binding var colorMode : String
    @Binding var rgbColour: RGB

    var body: some View {
            ForEach(colors) { item in
                VStack{
                    Text("Hex Value :\(item.hex.value)").foregroundColor(.white)
                    Text("r:\(item.rgb.fraction.r), g:\(item.rgb.fraction.g), b:\(item.rgb.fraction.b)")
                        .foregroundColor(.white)
                        
                        
                }.background(Color.init(red: item.rgb.fraction.r, green: item.rgb.fraction.g, blue: item.rgb.fraction.b))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }

            .edgesIgnoringSafeArea(.all)
        
                .onAppear{
            Api().getPosts(colorMode: self.colorMode, color: self.rgbColour){ (colorModeResponse) in
                self.colors = colorModeResponse.colors
            }
        }
        
    }
}

struct ColorModeView_Previews: PreviewProvider {
    
    static var previews: some View {
        ColorModeView(colorMode: .constant("intial value"), rgbColour: .constant(RGB(r: 1, g: 1, b: 1)))
    }
}

func hexString(_ rgb: RGB) -> String {
    let r:CGFloat = rgb.r
    let g:CGFloat = rgb.g
    let b:CGFloat = rgb.b

    let rgbNum:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    return String(format: "%06x", rgbNum)
}
