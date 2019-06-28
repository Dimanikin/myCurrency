//
//  TableViewController.swift
//  myCurrency
//
//  Created by Dima on 25/05/2019.
//  Copyright © 2019 Dima Anikin. All rights reserved.
//

//  JSON
//  http://www.floatrates.com/daily/usd.json
//  https://www.cbr-xml-daily.ru/daily_json.js


import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    var arrayOfMoney = [TypeCurrency]() {
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
                
                let parseJson = try JSONDecoder().decode(DailyCurrency.self, from: data)
                self.arrayOfMoney.append(parseJson.valute.usd)
                self.arrayOfMoney.append(parseJson.valute.eur)
                self.arrayOfMoney.append(parseJson.valute.sgd)
                self.arrayOfMoney.append(parseJson.valute.byn)
                self.arrayOfMoney.append(parseJson.valute.pln)
                self.arrayOfMoney.append(parseJson.valute.tryLira)
                print(parseJson)
                
            } catch  let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
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
        cell.charCodeLabel?.text = currency.charCode
        cell.nameLabel?.text = currency.name
        cell.valueTextField.text = "\(NSString(format:"%.2f", currency.value))"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
