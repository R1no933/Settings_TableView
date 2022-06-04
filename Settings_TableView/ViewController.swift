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

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingSwitchOption)
}

struct SettingSwitchOption {
    let title: String
    let iconImage: UIImage?
    let backgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct Section {
    let title: String
    let option: [SettingsOptionType]
}

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var models = [Section]()
    
    //Создаем таблицу
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifire)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifire)
        
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
        models.append(Section(title: "Network Settings", option: [
            .switchCell(model: SettingSwitchOption(title: "Авиарежим", iconImage: UIImage(systemName: "airplane"), backgroundColor: UIColor.systemOrange, handler: {
                
                print("Нажат Авиарежим")
                
            }, isOn: false)),
            .staticCell(model: SettingsOption(title: "Wi-Fi", iconImage: UIImage(systemName: "wifi"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Wi-Fi")
            })),
            .staticCell(model: SettingsOption(title: "Bluetooth", iconImage: UIImage(systemName: "bolt.horizontal"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Bluetooth")
            })),
            .staticCell(model: SettingsOption(title: "Сотовая связь", iconImage: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажата сотовая связь")
            })),
            .staticCell(model: SettingsOption(title: "Режим модема", iconImage: UIImage(systemName: "personalhotspot"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажат Режим модема")
            })),
            .switchCell(model: SettingSwitchOption(title: "VPN", iconImage: UIImage(systemName: "network.badge.shield.half.filled"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат VPN")
            }, isOn: false))
        ]))
        
        models.append(Section(title: "Notification Settings", option: [
            .staticCell(model: SettingsOption(title: "Уведомления", iconImage: UIImage(systemName: "bell.badge.fill"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажаты уведомления")
            })),
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", iconImage: UIImage(systemName: "speaker.wave.2"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажат Звуки, тактильные сигналы")
            })),
            .staticCell(model: SettingsOption(title: "Фокусирование", iconImage: UIImage(systemName: "moon.fill"), backgroundColor: UIColor.purple, handler: {
                print("Нажато Фокусирование")
            })),
            .staticCell(model: SettingsOption(title: "Экранное время", iconImage: UIImage(systemName: "clock.fill"), backgroundColor: UIColor.purple, handler: {
                print("Нажато Экранное время")
            }))
        ]))
        
        models.append(Section(title: "General Settings", option: [
            .staticCell(model: SettingsOption(title: "Основное", iconImage: UIImage(systemName: "gear"), backgroundColor: UIColor.systemGray, handler: {
                print("Нажато Основное")
            })),
            .staticCell(model: SettingsOption(title: "Пункт управления", iconImage: UIImage(systemName: "switch.2"), backgroundColor: UIColor.systemGray, handler: {
                print("Нажат Пункт управления")
            })),
            .staticCell(model: SettingsOption(title: "Экран и яркость", iconImage: UIImage(systemName: "textformat.size"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Экран и яркость")
            })),
            .staticCell(model: SettingsOption(title: "Экран «Домой»", iconImage: UIImage(systemName: "house"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Экран домой")
            })),
            .staticCell(model: SettingsOption(title: "Универсальный доступ", iconImage: UIImage(systemName: "figure.walk.circle"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Универсальный доступ")
            })),
            .staticCell(model: SettingsOption(title: "Обои", iconImage: UIImage(systemName: "photo"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Обои")
            })),
            .staticCell(model: SettingsOption(title: "Siri и Поиск", iconImage: UIImage(systemName: "mic.fill"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Сири и поиск")
            })),
            .staticCell(model: SettingsOption(title: "Face ID и код-пароль", iconImage: UIImage(systemName: "faceid"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажат Фэйс айди")
            })),
            .staticCell(model: SettingsOption(title: "Экстренный вызов - SOS", iconImage: UIImage(systemName: "bandage"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажат Экстренный вызов")
            })),
            .staticCell(model: SettingsOption(title: "Уведомления о контакте", iconImage: UIImage(systemName: "facemask"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажат Уведомление о контакте")
            })),
            .staticCell(model: SettingsOption(title: "Аккумулятор", iconImage: UIImage(systemName: "battery.100"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажат Аккумулятор")
            })),
            .staticCell(model: SettingsOption(title: "Конфиденциальность", iconImage: UIImage(systemName: "hand.raised.fill"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Конфиденциальность")
            })),
            
        ]))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
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
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }

}

