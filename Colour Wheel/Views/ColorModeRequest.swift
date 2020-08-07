//
//  ColorModeRequest.swift
//  Colour Wheel
//
//  Created by Dang Jun We on 8/4/20.
//

import Foundation

struct Post:Codable, Identifiable {
    let id = UUID()
    var title:String
    var body: String
}

class Api {
    func getPosts(colorMode:String, color: RGB, completion: @escaping(ColorModeResponse) -> ()) {
        let hexValue = hexString(color)
        print(hexValue)
        let retriveColorCount = "6"
        let resourceString = "http://thecolorapi.com/scheme?hex=\(hexValue)&mode=\(colorMode)&count=\(retriveColorCount)"
        

        guard let url = URL(string: resourceString) else { return }
        print(url)
        URLSession.shared.dataTask(with: url)  { (data, _, _) in
            let posts = try! JSONDecoder().decode(ColorModeResponse.self, from:data!)
            DispatchQueue.main.async {
                completion(posts) 
            }
        }
        .resume()
    }
}
