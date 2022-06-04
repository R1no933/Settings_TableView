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
    
    var models = [Section]()
    
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
        models.append(Section(title: "", option: [
            SettingsOption(title: "Авиарежим", iconImage: UIImage(systemName: "airplane"), backgroundColor: UIColor.systemOrange, handler: {
                print("Нажат Авиарежим")
            }),
            SettingsOption(title: "Wi-Fi", iconImage: UIImage(systemName: "wifi"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Wi-Fi")
            }),
            SettingsOption(title: "Bluetooth", iconImage: UIImage(systemName: "bolt.horizontal"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Bluetooth")
            }),
            SettingsOption(title: "Сотовая связь", iconImage: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажата сотовая связь")
            }),
            SettingsOption(title: "Режим модема", iconImage: UIImage(systemName: "personalhotspot"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажат Режим модема")
            }),
            SettingsOption(title: "VPN", iconImage: UIImage(systemName: "network.badge.shield.half.filled"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат VPN")
            })
        ]))
        
        models.append(Section(title: "", option: [
            SettingsOption(title: "Уведомления", iconImage: UIImage(systemName: "bell.badge.fill"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажаты уведомления")
            }),
            SettingsOption(title: "Звуки, тактильные сигналы", iconImage: UIImage(systemName: "speaker.wave.2"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажат Звуки, тактильные сигналы")
            }),
            SettingsOption(title: "Фокусирование", iconImage: UIImage(systemName: "moon.fill"), backgroundColor: UIColor.purple, handler: {
                print("Нажато Фокусирование")
            }),
            SettingsOption(title: "Экранное время", iconImage: UIImage(systemName: "clock.fill"), backgroundColor: UIColor.purple, handler: {
                print("Нажато Экранное время")
            })
        ]))
        
        models.append(Section(title: "", option: [
            SettingsOption(title: "Основное", iconImage: UIImage(systemName: "gear"), backgroundColor: UIColor.systemGray, handler: {
                print("Нажато Основное")
            }),
            SettingsOption(title: "Пункт управления", iconImage: UIImage(systemName: "switch.2"), backgroundColor: UIColor.systemGray, handler: {
                print("Нажат Пункт управления")
            }),
            SettingsOption(title: "Экран и яркость", iconImage: UIImage(systemName: "textformat.size"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Экран и яркость")
            }),
            SettingsOption(title: "Экран «Домой»", iconImage: UIImage(systemName: "house"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Экран домой")
            }),
            SettingsOption(title: "Универсальный доступ", iconImage: UIImage(systemName: "figure.walk.circle"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Универсальный доступ")
            }),
            SettingsOption(title: "Обои", iconImage: UIImage(systemName: "photo"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Обои")
            }),
            SettingsOption(title: "Siri и Поиск", iconImage: UIImage(systemName: "mic.fill"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Сири и поиск")
            }),
            SettingsOption(title: "Face ID и код-пароль", iconImage: UIImage(systemName: "faceid"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажат Фэйс айди")
            }),
            SettingsOption(title: "Экстренный вызов - SOS", iconImage: UIImage(systemName: "bandage"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажат Экстренный вызов")
            }),
            SettingsOption(title: "Уведомления о контакте", iconImage: UIImage(systemName: "facemask"), backgroundColor: UIColor.systemRed, handler: {
                print("Нажат Уведомление о контакте")
            }),
            SettingsOption(title: "Аккумулятор", iconImage: UIImage(systemName: "battery.100"), backgroundColor: UIColor.systemGreen, handler: {
                print("Нажат Аккумулятор")
            }),
            SettingsOption(title: "Конфиденциальность", iconImage: UIImage(systemName: "hand.raised.fill"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Конфиденциальность")
            }),
            
        ]))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelLabel = models[indexPath.section].option[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifire, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: modelLabel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let modelLabel = models[indexPath.section].option[indexPath.row]
        modelLabel.handler()
    }

}

