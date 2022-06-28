//
//  SettingsViewController.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 27.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private var settingView: SettingsView? {
        guard isViewLoaded else  { return nil }
        return view as? SettingsView
    }
    
    var model: SettingModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        title = "Настройки"
        model = SettingModel()
        configureView()
    }
}

private extension SettingsViewController {
    func configureView() {
        guard let models = model?.configureModel() else { return }
        settingView?.configureView(with: models)
    }
}
