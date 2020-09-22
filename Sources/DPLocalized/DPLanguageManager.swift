//
//  DPLanguageManager.swift
//  DPLocalized
//
//  Created by Hongli Yu on 2020/9/22.
//

import UIKit

final class DPLanguageManager {

  static let shared = DPLanguageManager()
  private let kCurrentLanguageKey = "AppleLanguages"
  private var currentBundle = Bundle.main
  private(set) var currentLanguage: DPAppLanguage
    
  var languages: [DPAppLanguage] = {
    var array = [DPAppLanguage]()
    let codes = Bundle.main.localizations
    for code in codes {
      let language = DPAppLanguage(code: code)
      array.append(language)
    }
    return array
  }()

  lazy var localizedNames: [String] = {
    var array = [String]()
    for language in languages {
      array.append(language.localizedName)
    }
    return array
  }()

  lazy var englishNames: [String] = {
    var array = [String]()
    for language in languages {
      array.append(language.englishName)
    }
    return array
  }()

  private init() {
    guard let currentLanguageCodes = UserDefaults.standard.object(forKey: kCurrentLanguageKey) as? [String],
          let currentLanguageCode = currentLanguageCodes.first else {
      currentLanguage = DPAppLanguage(code: "en")
      return
    }
    currentLanguage = DPAppLanguage(code: currentLanguageCode)
  }

  private func setCurrentLanguage(_ language: DPAppLanguage) {
    currentLanguage = language
    setLanguageInApp(currentLanguage.code)
    NotificationCenter.default.post(name: DPNotification.languageDidChange, object: nil)
  }

  private func setLanguageInApp(_ code: String) {
    UserDefaults.standard.set([code], forKey: "AppleLanguages")
    UserDefaults.standard.synchronize()
    guard let bundlePath = Bundle.main.path(forResource: code, ofType: "lproj"),
          let bundle =  Bundle(path: bundlePath) else { return }
    currentBundle = bundle
  }

  func popup(_ viewController: UIViewController) {
    viewController.present(DPLanguagesViewController(), animated: true, completion: nil)
  }

  public func setCurrentLanguage(englishName: String) {
    for language in languages where language.englishName == englishName {
      setCurrentLanguage(language)
    }
  }

  public func resetDefaultLanguageToEnglish() {
    setCurrentLanguage(DPAppLanguage(code: "en"))
  }

  public func localize(_ inputString: String) -> String {
    return currentBundle.localizedString(forKey: inputString, value: inputString, table: nil)
  }

}

public struct DPNotification {
  static let languageDidChange = NSNotification.Name(rawValue: "languageDidChange")
}

