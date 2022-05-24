//
//  UIViewController.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 24/05/2022.
//

import Foundation
import UIKit


extension UIViewController{
    
    // Aleart Message

        func showAlert(message:String,title:String) {
            let alert = UIAlertController(title: title, message: message,         preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                  //Cancel Action
              }))
            
              self.present(alert, animated: true, completion: nil)
          }
 
}
