//
//  NetworkTableViewCell.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 04.06.2022.
//

import UIKit

class NetworkTableViewCell: UITableViewCell {
    static let identifire = "NetworkTableViewCell"
    
    //MARK: - UI's element
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
    
    private let detailLabel: UILabel = {
        let detail = UILabel()
        
        detail.textColor = UIColor.systemGray
        detail.numberOfLines = 1
        detail.textAlignment = .right
        
        return detail
    }()
    
    //MARK: Reinit content's
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(detailLabel)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Layout's UI's
    override func layoutSubviews() {
        super.layoutSubviews()
        let containerSize: CGFloat = contentView.frame.height - 10
        
        iconContainer.frame = CGRect(x: 15, y: 6, width: containerSize, height: containerSize)
        
        let imageSize: CGFloat = containerSize / 1.5
        
        iconImageView.frame = CGRect(x: (containerSize - imageSize) / 2, y: (containerSize - imageSize) / 2, width: imageSize, height: imageSize)
        
        itemLabel.frame = CGRect(x: 25 + iconContainer.frame.size.width, y: 0, width: contentView.frame.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
        
        detailLabel.frame = CGRect(x: 46, y: 0, width: contentView.frame.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
        
    }
    
    //MARK: Prepare for reuse UI's
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        itemLabel.text = nil
        iconContainer.backgroundColor = nil
        detailLabel.text = nil
    }
    
    //MARK: - Configure UI's
    public func configure(with model: NetworkOption) {
        itemLabel.text = model.title
        iconImageView.image = model.iconImage
        iconContainer.backgroundColor = model.backgroundColor
        detailLabel.text = model.detail
    }
}
