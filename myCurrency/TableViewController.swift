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
    /*
    var arrayOfImage = ["USD","EUR","SGD","BYN","PLN","LKR","INR","KZT"]
    var arrayOfMoney = [TypeCurrency]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateCourseButton(_ sender: UIBarButtonItem) {
        // fetchRequest()
    }
    
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {}
    
}

// MARK: - Table view data source
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //arrayOfMoney.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomizeCell
       // configureCell(cell: cell, for: indexPath)
        
        return cell
    }
    /*
     private func configureCell(cell: CustomizeCell, for indexPath: IndexPath) {
     let currency = arrayOfMoney[indexPath.row]
     cell.charCodeLabel?.text = currency.alphaCode
     cell.nameLabel?.text = currency.name
     cell.valueTextField.text = String(format:"%.2f", currency.inverseRate) // округляем до двух знаков после запятой
     cell.imageViewPic.image = UIImage(named: arrayOfImage[indexPath.row])
     }
     */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}

