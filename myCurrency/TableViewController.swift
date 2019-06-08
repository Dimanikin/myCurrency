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
    
    
    var arrayOfMoney = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                
                let parseJson = try JSONDecoder().decode(DailyCurrency.self, from: data)
                
                print(parseJson)
                self.arrayOfMoney.append(parseJson)
                
                //print(self.arrayOfMoney)
                
                // for field in parseJson {
                //      self.arrayOfMoney.append(field)
                // }
                //self.tableView.reloadData()
                
            } catch  let error {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1 //arrayOfMoney.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomizeCell
        configureCell(cell: cell, for: indexPath)
        
        return cell
    }
    
    func configureCell(cell: CustomizeCell, for indexPath: IndexPath) {
        
        
         //let array = arrayOfMoney[indexPath.row]
        cell.charCodeLabel?.text = arrayOfMoney[indexPath.row] as? String
         //cell.nameLabel?.text = array.
         
         //cell.valueLabel.text = (String(array.Value)!)!
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
