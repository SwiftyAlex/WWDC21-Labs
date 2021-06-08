//
//  Coffee.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation

struct Coffee: Hashable {
    let name: String
    let imageUrl: URL?
    
    static let all: [Coffee] = [
        .cortado, .flatWhite, .mocha, .latte, .icedLatte, .hotChocolate
    ]
    
    // These images are random images from google; I do not own the rights to any of them.
    static let cortado = Coffee(name: "Cortado", imageUrl: URL(string: "https://perfectdailygrind.com/wp-content/uploads/2020/03/Cortadito-1.png"))
    static let flatWhite = Coffee(name: "Flat White", imageUrl: URL(string: "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2Farchive%2Fdec9c648258de35dd9722fdf6b73afe5c747aa94"))
    static let mocha = Coffee(name: "Mocha", imageUrl: URL(string: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/the_perfect_mocha_coffee_29100_16x9.jpg"))
    static let latte = Coffee(name: "Latte", imageUrl: URL(string: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
    static let icedLatte = Coffee(name: "Iced Latte", imageUrl: URL(string: "https://www.alphafoodie.com/wp-content/uploads/2020/08/Iced-Latte-1-of-1-2.jpeg"))
    static let hotChocolate = Coffee(name: "Hot Chocolate", imageUrl: URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHRrJm1E0ctfcSXnflzMdSdP9noYcomDv-lg&usqp=CAU"))
}


