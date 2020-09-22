# DPLocalized

Change languages inside the app, no need to wait the screen to reboot any more.

[![Cocoapods](https://img.shields.io/cocoapods/v/DPLocalized.svg)](http://cocoapods.org/?q=DPLocalized)
[![Pod License](http://img.shields.io/cocoapods/l/DPLocalized.svg)](https://github.com/HongliYu/DPLocalized/blob/master/LICENSE)
[![Swift-5.3](https://img.shields.io/badge/Swift-5.3-blue.svg)]()
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<img src="https://github.com/HongliYu/DPLocalized/blob/master/demo.gif?raw=true" alt="alt text"  height="400">

## Usage
First of all, the app needs to support multi-language, or another professional word "Localizations" in Xcode project.

Add notifications, to reload data of current page, or previous pages in the memory

```  swift
  func addNotifications() {
    NotificationCenter
      .default
      .addObserver(self, selector: #selector(languageDidChange(_:)),
                   name: DPNotification.languageDidChange, object: nil)
  }

  deinit {
    NotificationCenter
      .default
      .removeObserver(self, name: DPNotification.languageDidChange, object: nil)
  }

  @objc func languageDidChange(_ notification: Notification) {
    tableView.reloadData()
  }
```
Then add this line to the entry, it will open the language setting menu

```  swift
  DPLanguageManager.shared.popup(self)
```

And for the strings need to be localized, there is a syntax sugar in extension
```  swift
  "puppy".localized
```

And that's all. Thanks

