//
//  DPLanguagesViewController.swift
//  DPLocalized
//
//  Created by Hongli Yu on 2020/9/22.
//

import UIKit

class DPLanguagesViewController: UIViewController {

  private let tableView = UITableView()
  private let veiwModels: [DPAppLanguage] = DPLanguageManager.shared.languages
  private var selectedIndexPath = IndexPath()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerCell([DPLanguageTableViewCell.self])
    tableView.bounces = false
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }

}

// MARK: - Table view datasource/delegate
extension DPLanguagesViewController: UITableViewDataSource & UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return veiwModels.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DPLanguageTableViewCell", for: indexPath)
    let veiwModel = veiwModels[indexPath.row]
    cell.textLabel?.text = veiwModel.localizedName
    if DPLanguageManager.shared.currentLanguage == veiwModel {
      cell.accessoryType = .checkmark
      selectedIndexPath = indexPath
    } else {
      cell.accessoryType = .none
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let previous = tableView.cellForRow(at: selectedIndexPath) {
      previous.accessoryType = .none
    }
    if let current = tableView.cellForRow(at: indexPath) {
      current.accessoryType = .checkmark
      selectedIndexPath = indexPath
    }
    let language = veiwModels[indexPath.row]
    DPLanguageManager.shared.setCurrentLanguage(englishName: language.englishName)
  }

}
