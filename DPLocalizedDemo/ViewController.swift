//
//  ViewController.swift
//  DPLocalizedDemo
//
//  Created by Hongli Yu on 2020/9/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  private let veiwModels = ["orangutan", "monkey", "antelope",
                            "snow leopard", "robot", "fighter"]

  override func viewDidLoad() {
    super.viewDidLoad()
    addNotifications()
  }

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

  @IBAction func openLanguageMenu(_ sender: Any) {
    DPLanguageManager.shared.popup(self)
  }

}

// MARK: - Table view datasource/delegate
extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return veiwModels.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NameTagTableViewCell", for: indexPath)
    let veiwModel = veiwModels[indexPath.row]
    cell.textLabel?.text = veiwModel.localized
    return cell
  }

}
