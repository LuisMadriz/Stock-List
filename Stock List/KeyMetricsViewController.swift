//
//  KeyMetricsViewController.swift
//  Stock List
//
//  Created by Luis Madriz on 4/30/22.
//

import UIKit

class KeyMetricsViewController: UIViewController {
    
    let url = URL(string: "https://financialmodelingprep.com/api/v3/ratios/AAPL?apikey=087de735c76deedab08e815ecbb5edce")
    
    private var metrics : KeyMetrics?
    
    
    
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ROALabel: UILabel!
    @IBOutlet var ROELabel: UILabel!
    @IBOutlet var PERLabel: UILabel!
    @IBOutlet var PEGRLabel: UILabel!
    @IBOutlet var debtRatioLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson2()
        
        

    }
    
    func downloadJson2() {
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded 2")
            do
            {
                let decoder = JSONDecoder()
                let downloadedMetrics = try decoder.decode([KeyMetrics].self, from: data)
                self.metrics = downloadedMetrics.first
                guard let metrics = self.metrics else {
                    return
                }
                DispatchQueue.main.async {
                    self.symbolLabel.text = metrics.symbol
                    self.dateLabel.text = metrics.date
                    self.ROALabel.text = "\(metrics.returnOnAssets)"
                    self.ROELabel.text = "\(metrics.returnOnEquity)"
                    self.PERLabel.text = "\(metrics.priceEarningsRatio)"
                    self.PEGRLabel.text = "\(metrics.priceEarningsToGrowthRatio)"
                    self.debtRatioLabel.text = "\(metrics.debtRatio)"
                }
                
                
            }catch {
                print(error)
            }
        }.resume()
        
    }
    
}
