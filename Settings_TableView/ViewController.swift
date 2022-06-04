//
//  ViewController.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 04.06.2022.
//
struct SettingsOption {
    let title: String
    let iconImage: UIImage?
    let backgroundColor: UIColor
    let handler: (() -> Void)
}

struct Section {
    let title: String
    let option: [SettingsOption]
}

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var models = [SettingsOption]()
    
    //Создаем таблицу
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifire)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Прописываем делегата и дату и задаем заголовок
        title = "Настройки"
        configure()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
    }
    
    func configure() {
        self.models = Array(0...20).compactMap({
            SettingsOption(title: "\($0)", iconImage: UIImage(systemName: "house"), backgroundColor: .systemOrange) {
                
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelLabel = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifire, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: modelLabel)
        
        return cell
    }

}

