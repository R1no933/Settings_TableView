//
//  SettingModel.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 27.06.2022.
//

import Foundation
import UIKit

class SettingModel {
    
    func configureModel() -> [Section] {
        
        var models = [Section]()
        
        models.append(Section(title: "Network Settings", option: [
            .switchCell(model: SettingSwitchOption(title: "Авиарежим", iconImage: UIImage(systemName: "airplane"), backgroundColor: UIColor.systemOrange, handler: {
                
                print("Нажат Авиарежим")
                
            }, isOn: false)),
            .networkCell(model: NetworkOption(title: "Wi-Fi", detail: "Sweet_Home", iconImage: UIImage(systemName: "wifi"), backgroundColor: UIColor.systemBlue, handler: {
                print("Нажат Wi-Fi")
            })),
            .networkCell(model: NetworkOption(title: "Bluetooth", detail: "Не подключен", iconImage: UIImage(systemName: "bolt.horizontal"), backgroundColor: UIColor.systemBlue, handler: {
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
        
      return models
    }
}

