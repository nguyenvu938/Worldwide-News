//
//  CustomCell.swift
//  NewsAPI
//
//  Created by NguyenVu on 21/11/2020.
//

import UIKit

class CustomCell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .purple
        return label
    }()
    
    let newImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textAlignment = .justified
        label.textColor = .gray
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        addSubview(containerView)
        addSubview(titleLabel)
        addSubview(newImageView)
        addSubview(descriptionLabel)
        addSubview(timeLabel)
    }
    
    func setupLayout() {
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

        newImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        newImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        newImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        newImageView.heightAnchor.constraint(equalTo: newImageView.widthAnchor, multiplier: 0.5).isActive = true

        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }

}
