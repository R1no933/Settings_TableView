//
//  SettingsOption.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 04.06.2022.
//

import UIKit

struct SettingsOption {
    let title: String
    let iconImage: UIImage?
    let backgroundColor: UIColor
    let handler: (() -> Void)
}

