//
//  TableViewController.swift
//  myCurrency
//
//  Created by Dima on 25/05/2019.
//  Copyright © 2019 Dima Anikin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    var arrayOfImage = ["USD","EUR","SGD","BYN","PLN","TRY","INR","KZT"]
    var arrayOfMoney = [Valute]() {
        didSet {
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRequest()
    }
    
    // MARK: - Private Methods
    private func fetchRequest() {
        
        guard let url = URL(string: Contents.urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        guard let data = data, error == nil else { return }
            
            do {
                
                let parseJson = try JSONDecoder().decode(Valute.self, from: data)
                self.arrayOfMoney.insert(parseJson, at: 0)
                
            } catch  let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    @IBAction func updateCourseButton(_ sender: UIBarButtonItem) {
        fetchRequest()
    }
    
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {}
    
}

// MARK: - Table view data source
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMoney.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomizeCell
        configureCell(cell: cell, for: indexPath)
        
        return cell
    }

    private func configureCell(cell: CustomizeCell, for indexPath: IndexPath) {
        let currency = arrayOfMoney[indexPath.row]

        cell.charCodeLabel?.text = currency.usd.alphaCode
        cell.nameLabel?.text = currency.usd.name
        cell.valueTextField.text = "\(NSString(format:"%.2f", currency.usd.inverseRate))"
        cell.imageViewPic.image = UIImage(named: arrayOfImage[indexPath.row])
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}

