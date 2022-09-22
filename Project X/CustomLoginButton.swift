//
//  CustomLoginButton.swift
//  Project X
//
//  Created by Dmitriy Eni on 12.09.2022.
//

import UIKit

struct CustomLoginButtonViewModel {
    let textLabel: String
    let imageView: String
    let backgroundColor: UIColor
    let tintColor: UIColor
}

final class CustomLoginButton: UIButton {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel)
        addSubview(iconImageView)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.borderWidth = 1.4
        layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        layer.shadowColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 2.5, height: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configurate(with viewModel: CustomLoginButtonViewModel) {
        textLabel.text = viewModel.textLabel
        textLabel.textColor = viewModel.tintColor
        iconImageView.image = UIImage(named: viewModel.imageView)
        iconImageView.tintColor = viewModel.tintColor
        layer.backgroundColor = viewModel.backgroundColor.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.sizeToFit()
        let iconSize: CGFloat = 20
        let xPosition: CGFloat = (frame.size.width - textLabel.frame.size.width - iconSize - 5) / 2
        iconImageView.frame = CGRect(x: xPosition,
                                     y: (frame.size.height - iconSize) / 2,
                                     width: iconSize,
                                     height: iconSize)
        textLabel.frame = CGRect(x: xPosition + iconSize + 12,
                                 y: 0,
                                 width: textLabel.frame.size.width,
                                 height: frame.size.height)
    }
}
