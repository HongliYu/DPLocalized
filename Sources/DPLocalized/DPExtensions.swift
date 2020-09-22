//
//  DPExtensions.swift
//  DPLocalized
//
//  Created by Hongli Yu on 2020/9/22.
//

import UIKit

extension UITableView {
  
  func registerCell(_ cellTypes: [AnyClass]) {
    for cellType in cellTypes {
      let typeString = String(describing: cellType)
      let xibPath = Bundle(for: cellType).path(forResource: typeString, ofType: "nib")
      if xibPath == nil {
        self.register(cellType, forCellReuseIdentifier: typeString)
      } else {
        self.register(UINib(nibName: typeString, bundle: nil), forCellReuseIdentifier: typeString)
      }
    }
  }
  
}

public extension String {
  
  var localized: String {
    return DPLanguageManager.shared.localize(self)
  }
  
}
