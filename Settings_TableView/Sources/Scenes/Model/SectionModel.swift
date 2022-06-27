//
//  SectionModel.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 27.06.2022.
//

import Foundation
import UIKit

struct SettingsOption {
    let title: String
    let iconImage: UIImage?
    let backgroundColor: UIColor
    let handler: (() -> Void)
}

struct NetworkOption {
    let title: String
    let detail: String
    let iconImage: UIImage?
    let backgroundColor: UIColor
    let handler: (() -> Void)
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingSwitchOption)
    case networkCell(model: NetworkOption)
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
