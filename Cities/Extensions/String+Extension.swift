//
//  String+Extension.swift
//  Cities
//
//  Created by Rami on 2/14/20.
//  Copyright © 2020 Rami Saeed. All rights reserved.
//

import Foundation

extension String {
    var isValidString: Bool {
        return !self.isEmpty && !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
