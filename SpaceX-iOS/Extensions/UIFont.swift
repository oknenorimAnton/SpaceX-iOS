//
//  UIFont.swift
//  SpaceX-iOS
//
//  Created by Антон on 20.08.2022.
//

import Foundation
import UIKit

extension UIFont {
    
    class LabGrotesque {
        
        func Bold(size: CGFloat) -> UIFont? {
            return UIFont(name: "LabGrotesque-Bold", size: size)
        }
        func Regular(size: CGFloat) -> UIFont? {
            return UIFont(name: "LabGrotesque-Regular", size: size)
        }
    }
}
