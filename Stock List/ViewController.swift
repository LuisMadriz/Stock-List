//
//  ViewController.swift
//  Stock List
//
//  Created by Luis Madriz on 4/25/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let url = URL(string: "https://financialmodelingprep.com/api/v3/stock/list?apikey=087de735c76deedab08e815ecbb5edce")
    
    private var stockNames = [StockList]()
    
    var filteredData: [StockList] = []
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        
        searchBar.delegate = self
        
        
        
    }
    
    func downloadJson() {
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded")
            do
            {
                let decoder = JSONDecoder()
                let downloadedStocks = try decoder.decode([StockList].self, from: data)
                self.stockNames = downloadedStocks
                self.filteredData = downloadedStocks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch {
                print("something is wrong after downloaded")
            }
        }.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as? StockCell else {return UITableViewCell() }
        
        cell.symbolLabel.text = "Symbol: " + filteredData[indexPath.row].symbol
        cell.nameLabel.text = "Name: " + filteredData[indexPath.row].name
        
        return cell
    }
    
    // MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            
            filteredData = stockNames
        }
        else {
            for stocksItem in stockNames {
                if stocksItem.name.lowercased().contains(searchText.lowercased()) {
                    
                    filteredData.append(stocksItem)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.stock = filteredData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}


