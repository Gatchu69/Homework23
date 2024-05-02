//
//  TableViewCell.swift
//  Homework23
//
//  Created by Nodiko Gachava on 03.05.24.
//

import UIKit

class TableViewCell: UITableViewCell {
    // MARK: - Variables
    static let identifier = "TableViewCell"
    
    
    // MARK: - UI Components
    lazy var contentFrame: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 15
            view.layer.masksToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.text = "sasass"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundViewShadow: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
 
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = UIColor(named: "pinkPanther")
            self.setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    // MARK: - UI Setup
    func setupUI() {
        contentView.addSubview(contentFrame)
        contentFrame.addSubview(backImage)
        contentFrame.addSubview(label)
        backImage.addSubview(backgroundViewShadow)
        
        NSLayoutConstraint.activate([
            contentFrame.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentFrame.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentFrame.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contentFrame.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        
            backImage.topAnchor.constraint(equalTo: contentFrame.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: contentFrame.bottomAnchor),
            backImage.trailingAnchor.constraint(equalTo: contentFrame.trailingAnchor),
            backImage.leadingAnchor.constraint(equalTo: contentFrame.leadingAnchor),
            
            label.topAnchor.constraint(equalTo: contentFrame.topAnchor, constant: 17),
            label.bottomAnchor.constraint(equalTo: contentFrame.bottomAnchor, constant: -17),
            label.centerXAnchor.constraint(equalTo: contentFrame.centerXAnchor),
            
            backgroundViewShadow.topAnchor.constraint(equalTo: backImage.topAnchor),
            backgroundViewShadow.bottomAnchor.constraint(equalTo: backImage.bottomAnchor),
            backgroundViewShadow.trailingAnchor.constraint(equalTo: backImage.trailingAnchor),
            backgroundViewShadow.leadingAnchor.constraint(equalTo: backImage.leadingAnchor),
        ])
    }
    
    public func configure(fact: Facts ) {
        label.text = fact.fact
        
    }
    
   
    


}
