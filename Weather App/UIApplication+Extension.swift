//
//  UIApplication+Extension.swift
//  Weather App
//
//  Created by Adarsh Raghav on 03/05/21.
//

import UIKit

extension UIApplication{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
