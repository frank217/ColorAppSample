//
//  ColorModeRequest.swift
//  Colour Wheel
//
//  Created by Dang Jun We on 8/4/20.
//  Copyright © 2020 Christian Privitelli. All rights reserved.
//

import Foundation
//
//enum ColorModeError :Error{
//    case noDataAvailable
//    case canNotProcessData
//
//}
//
//struct ColorModeRequest {
//    let resourceURL:URL
//
//    init(colorMode:String){
//        let hexValue = "24B1E0"
//        //let modeValue = "triad"
//        let retriveColorCount = "6"
//        let resourceString = "http://thecolorapi.com/scheme?hex=\(hexValue)&mode=\(colorMode)&count=\(retriveColorCount)"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
//
//        self.resourceURL = resourceURL
//    }
//
//    func getColorMode (completion: @escaping(Result<[ColorResponse], ColorModeError>) -> Void) {
//        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
//            guard let jsonData = data else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let colorModeResponse = try decoder.decode(ColorModeResponse.self, from: jsonData)
//                let colorDetails = colorModeResponse.colors
//                completion(.success(colorDetails))
//            } catch{
//                completion(.failure(.canNotProcessData))
//            }
//
//        }
//        dataTask.resume()
//    }
//}
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
