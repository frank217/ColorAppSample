//
//  ColorMode.swift
//  Colour Wheel
//
//  Created by Dang Jun We on 8/4/20.
//  Copyright © 2020 Christian Privitelli. All rights reserved.
//

import Foundation

struct ColorModeResponse : Codable {
    var mode: String
    var count: String
    var colors: [ColorResponse]
}

struct ColorResponse : Codable, Identifiable{
    let id = UUID()
    var rgb: RGBResponse
    var hex: HexResponse
}

struct HexResponse : Codable {
    var value: String
    var clean: String
}


struct RGBResponse : Codable {
    var fraction : RGBFraction
    var r : Int
    var g : Int
    var b : Int
}

struct RGBFraction: Codable {
    var r : Double
    var g : Double
    var b : Double
}
