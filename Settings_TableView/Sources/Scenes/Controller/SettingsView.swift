//
//  SettingsView.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 27.06.2022.
//

import UIKit

class SettingsView: UIView {
    //MARK: Confogure view
    
    func configureView(with models: [Section]) {
        self.models = models
        backgroundColor = UIColor.white
    }
    
    
   //MARK: - Propertie's
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifire)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifire)
        table.register(NetworkTableViewCell.self, forCellReuseIdentifier: NetworkTableViewCell.identifire)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private var models = [Section]()
    
    //MARK: - Init's
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHierarchy()
        setupLayout()
    }
    
    func setupHierarchy() {
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupLayout() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Count of section's and cell's
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    //MARK: - Configure cell by type
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifire, for: indexPath) as?
                    SettingsTableViewCell else {
                    return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifire, for: indexPath) as?
                    SwitchTableViewCell else {
                    return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .networkCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NetworkTableViewCell.identifire, for: indexPath) as?
                    NetworkTableViewCell else {
                    return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    //MARK: - Turn off cell selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        case .networkCell(let model):
            model.handler()
        }
    }
}
