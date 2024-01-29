//
//  StringExtension.swift
//  Sliceit
//
//  Created by AK on 1/29/24.
//

import Foundation

extension String {
    func isEmailValid() -> Bool {
            // criteria in regex.  See http://regexlib.com
            let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                        "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
            return emailTest.evaluate(with: self)
        }
}
