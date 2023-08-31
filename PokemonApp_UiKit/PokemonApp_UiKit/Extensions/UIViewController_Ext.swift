//
//  UIViewController_Ext.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 30/08/23.
//

import Foundation
import UIKit

extension UIViewController {
    func onTaphideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        
        tapGesture.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
