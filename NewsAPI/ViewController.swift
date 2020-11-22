//
//  ViewController.swift
//  NewsAPI
//
//  Created by NguyenVu on 21/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let wwnLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Worldwide News"
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = UIColor(red: 0.96, green: 0.41, blue: 0.40, alpha: 1.00)
        return label
    }()
    
    var titleArr = [String]()
    var urlArr = [String]()
    var urlToImageArr = [String]()
    var publishedAtArr = [String]()
    var descriptionArr = [String]()
    var contentArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupLayout()
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        getData()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(wwnLabel)
    }
    
    func setupLayout() {
        wwnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        wwnLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: wwnLabel.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func getData() {
        let url = "https://newsapi.org/v2/top-headlines?sources=bbc-news,cbc-news,nbc-news,fox-news,mtv-news=&page=1&pageSize=10&apiKey=27b8216f706d40a6bb206e7869fd3b95"
        
        AF.request(url, method: .get).responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for i in json["articles"].arrayValue {
                    titleArr.append(i["title"].stringValue)
                    urlArr.append(i["url"].stringValue)
                    urlToImageArr.append(i["urlToImage"].stringValue)
                    publishedAtArr.append(i["publishedAt"].stringValue)
                    descriptionArr.append(i["description"].stringValue)
                    contentArr.append(i["content"].stringValue)
                }
            case .failure(let error):
                print("Error is \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        cell.backgroundColor = UIColor(red: 0.96, green: 0.41, blue: 0.40, alpha: 1.00)
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.descriptionLabel.text = descriptionArr[indexPath.row]
        cell.newImageView.kf.setImage(with: URL(string: urlToImageArr[indexPath.row]))
        
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        let resultDate = dateFormatter.date(from: publishedAtArr[indexPath.row])
        cell.timeLabel.text = Date().timeAgo(from: resultDate!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let url = URL(string: urlArr[indexPath.row]) {
//            UIApplication.shared.open(url)
//        }
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(identifier: "ReadViewController") as! ReadViewController
        
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.titleLabel.text = titleArr[indexPath.row]
        resultVC.descriptionLabel.text = descriptionArr[indexPath.row]
        resultVC.newImageView.kf.setImage(with: URL(string: urlToImageArr[indexPath.row]))
        resultVC.contentLabel.text = contentArr[indexPath.row]
        
        self.present(resultVC, animated: false, completion: nil)
    }
}


