//
//  String.swift
//  SpaceX-iOS
//
//  Created by Антон on 26.08.2022.
//

import Foundation

extension String {
    
    func convertDateFormat(from fromFormat: String = "yyyy-MM-dd", to toFormat: String = "dd MMMM, yyyy") -> String {
        
        if let date = makeDate(with: fromFormat) {
            return date.toString(withFormat: toFormat)
        }
        return ""
    }
    
    func makeDate(with format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self)
    }
}
