//
//  FinalView.swift
//  Colour Wheel
//

import SwiftUI

/// The final view that presents everything.
struct FinalView: View {
    @State var colorMode = "InitialMode"
    @State var rgbColour = RGB(r: 0, g: 1, b: 1)
    @State var brightness: CGFloat = 1

    let listOfColorDetail = [ColorResponse ]()
    
    
    var body: some View {
        
        
        NavigationView{
            VStack {
                /// The text at the top.
                HStack {
                    Text("Pick a color")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
	                }
                    
                ColourWheel(radius: 300, rgbColour: $rgbColour, brightness: $brightness)
                    .padding()
                
                ColourShowView(rgbColour: $rgbColour)
                DropDownView(expand: false, colorMode: $colorMode).padding()

                NavigationLink(destination: ColorModeView(colorMode: $colorMode, rgbColour: $rgbColour)){
                            Text("Get Your Color Mode!")
                            .frame(minWidth: 0, maxWidth: 200)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(20)
                        
                        }
                    }
        }
        
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
