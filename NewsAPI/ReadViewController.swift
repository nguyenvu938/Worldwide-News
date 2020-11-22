//
//  ReadViewController.swift
//  NewsAPI
//
//  Created by NguyenVu on 22/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ReadViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Home", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.setImage(UIImage(systemName: "homekit"), for: .normal)
        button.tintColor = .darkGray
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    let newImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    var titleArr = [String]()
    var urlArr = [String]()
    var urlToImageArr = [String]()
    var publishedAtArr = [String]()
    var descriptionArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        view.addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(newImageView)
        containerView.addSubview(contentLabel)
    }
    
    func setupLayout() {
        containerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        backButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
            
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        newImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        newImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        newImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        newImageView.heightAnchor.constraint(equalTo: newImageView.widthAnchor, multiplier: 0.5).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: 20).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func onBack() {
        dismiss(animated: false, completion: nil)
        }
}
