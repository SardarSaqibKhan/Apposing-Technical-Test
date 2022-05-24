//
//  UILabel.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 24/05/2022.
//

import Foundation
import  UIKit
extension UILabel{
    
    var suggestedLblText:NSAttributedString?{
        
        let font = UIFont.boldSystemFont(ofSize: 25)
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,.font:font]

        let firstString = NSMutableAttributedString(string: "As a ")
        let secondString = NSAttributedString(string: "Java Script Developer ", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: "we think you might have the following skills:")

        firstString.append(secondString)
        firstString.append(thirdString)
        return firstString
    }
    
}
