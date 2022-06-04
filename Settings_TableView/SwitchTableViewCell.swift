//
//  SwitchTableViewCell.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 04.06.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    static let identifire = "SwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let container = UIView()
        container.clipsToBounds = true
        container.layer.cornerRadius = 8
        container.layer.masksToBounds = true
        
        return container
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.tintColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        
        return label
    }()
    
    private let switcher: UISwitch = {
        let switcher = UISwitch()
        
        switcher.onTintColor = UIColor.systemGreen
        
        return switcher
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(switcher)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let containerSize: CGFloat = contentView.frame.height - 10
        
        iconContainer.frame = CGRect(x: 15, y: 6, width: containerSize, height: containerSize)
        
        let imageSize: CGFloat = containerSize / 1.5
        
        iconImageView.frame = CGRect(x: (containerSize - imageSize) / 2, y: (containerSize - imageSize) / 2, width: imageSize, height: imageSize)
        
        itemLabel.frame = CGRect(x: 25 + iconContainer.frame.size.width, y: 0, width: contentView.frame.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
        
        switcher.sizeToFit()
        switcher.frame = CGRect(x: contentView.frame.size.width - switcher.frame.size.width - 20, y: (contentView.frame.size.height - switcher.frame.size.height) / 2, width: switcher.frame.size.width, height: switcher.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        itemLabel.text = nil
        iconContainer.backgroundColor = nil
        switcher.isOn = false
    }
    
    public func configure(with model: SettingSwitchOption) {
        itemLabel.text = model.title
        iconImageView.image = model.iconImage
        iconContainer.backgroundColor = model.backgroundColor
        switcher.isOn = model.isOn
    }
}
