//
//  Date.swift
//  SpaceX-iOS
//
//  Created by Антон on 26.08.2022.
//

import Foundation

extension Date {
    
    func toString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone =  .current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        return str
    }
}
