//
//  Extensions.swift
//  netflix
//
//  Created by Ankit Man Shakya on 23/06/2022.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String { self.prefix(1).uppercased() + self.lowercased().dropFirst() }
}
