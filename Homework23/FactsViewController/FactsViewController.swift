//
//  FactsViewController.swift
//  Homework23
//
//  Created by Nodiko Gachava on 02.05.24.
//

import UIKit

class FactsViewController: UIViewController {
    // MARK: - Variables
    let viewModel = FactsViewModel()
    var catDataArray = [Facts]()
    
    
    // MARK: - UI Components
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
     let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .systemBackground
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tv.allowsSelection = false
        return tv
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        setupUI()
        fetchFacts()
        viewModel.delegate = self
    }
    // MARK: - UI Setup
    
    func addTitle () {
        navigationItem.title = "Facts About Cats"
            navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI() {
        self.view.addSubview(backgroundImage)
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25 ),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
        ])
        
        tableView.rowHeight = 128
        
        
    }
    
    func fetchFacts() {
            viewModel.getInfo() { [weak self] result in
                switch result {
                case .success(let success):
                    self?.catDataArray = success.data
                    self?.tableView.reloadData()
                case .failure(let failure):
                    print("fetching failed. \(failure.localizedDescription)")
                }
            }
        }
}



 

