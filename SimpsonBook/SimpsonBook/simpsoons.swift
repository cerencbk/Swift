//
//  simpsoons.swift
//  SimpsonBook
//
//  Created by Ceren ÇABIK on 12.03.2024.
//

import Foundation
import UIKit

class Simpsoon{
    var name : String
    var job : String
    var image : UIImage
    
    init(simpsonName: String, simpsonJob: String, simpsonImage: UIImage) {
        self.name = simpsonName
        self.job = simpsonJob
        self.image = simpsonImage
    }
}
