//
//  ViewController.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/5/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var properties: [Property]!
    
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var propertyTableView: UITableView!
    
    var dateFormatter: DateFormatter!

    override func viewDidLoad() {
        super.viewDidLoad()
        sortCategory = .random
        setupPropertyTableView()
        sortButton.action = #selector(ViewController.showSortCategories)
        dateFormatter = DateFormatter()
    }

    func setupPropertyTableView() {
        let viewModel = ViewModel()
        properties = viewModel.properties
        propertyTableView.dataSource = self
    }
    
    var sortCategory: SortCategory!
    
    @IBAction func showSortCategories() {
        let sortController = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        let actions = [
            UIAlertAction(title: "Price", style: .default, handler: { action in
                self.handleSortOption(sortOption: .price)
            }),
            UIAlertAction(title: "Date", style: .default, handler: { action in
                self.handleSortOption(sortOption: .date)
            }),
            UIAlertAction(title: "Size", style: .default, handler: { action in
                self.handleSortOption(sortOption: .size)
            }),
            UIAlertAction(title: "Randomly", style: .default, handler: { action in
                self.handleSortOption(sortOption: .random)
            }),
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ]
        actions.forEach({ action in
            sortController.addAction(action)
        })
        present(sortController, animated: true, completion: nil)
    }
    
    func handleSortOption(sortOption: SortOption) {
        sortCategory = sortOption.sortCategory(previousSortCategory: sortCategory)
        properties = properties.sortByCategory(sortCategory: sortCategory)
        propertyTableView.reloadInputViews()
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let property = properties[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyCell.reuseIdentifier, for: indexPath) as! PropertyCell
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        cell.priceLabel.text = "$\(Int(property.price))"
        cell.bedBathLabel.text = "\(property.beds) bd / \(property.baths) baths"
        cell.sizeLabel.text = "\(property.size) sqft"
        dateFormatter.dateFormat = "MMM d, YYYY"
        let dateString = dateFormatter.string(from: property.dateAdded)
        cell.dateLabel.text = dateString
        return cell
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return properties[collectionView.tag].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let property = properties[collectionView.tag]
        let photoURL = property.photos[indexPath.item]
        do {
            if let imageURL = URL(string: photoURL) {
                let imageData = try Data(contentsOf: imageURL)
                cell.imageView.image = UIImage(data: imageData)
            }
        } catch {
            print("Error fetching image: \(error)")
        }
        return cell
    }
}
