//
//  DPAppLanguage.swift
//  DPLocalized
//
//  Created by Hongli Yu on 2020/9/22.
//

import Foundation

class DPAppLanguage: Equatable {
  
  let code: String
  let englishName: String
  let localizedName: String
  
  init(code: String) {
    self.code = code
    let localeEnglish = Locale(identifier: "en")
    self.englishName = localeEnglish.localizedString(forIdentifier: code) ?? ""
    let locale = Locale(identifier: code)
    self.localizedName = locale.localizedString(forIdentifier: code) ?? ""
  }
  
}

extension DPAppLanguage: CustomStringConvertible {
  
  var description: String {
    return "\(code), \(englishName), \(localizedName)"
  }
  
}

func == (lhs: DPAppLanguage, rhs: DPAppLanguage) -> Bool {
  
  return lhs.code == rhs.code
  
}
