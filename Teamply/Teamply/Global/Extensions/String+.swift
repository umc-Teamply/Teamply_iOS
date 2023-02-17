//
//  String+.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Foundation

extension String {
    func addSingleQuote(s: String) -> String {
        var string = s
        string.append("'")
        string = "'"+string
        return string
    }
}
