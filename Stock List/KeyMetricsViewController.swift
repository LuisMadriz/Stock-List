//
//  KeyMetricsViewController.swift
//  Stock List
//
//  Created by Luis Madriz on 4/30/22.
//

import UIKit

class KeyMetricsViewController: UIViewController {
    
    
    var symbolName: String?
    
    var url: URL?
    
    private var metrics : KeyMetrics?
    
    
    
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ROALabel: UILabel!
    @IBOutlet var ROELabel: UILabel!
    @IBOutlet var PERLabel: UILabel!
    @IBOutlet var PEGRLabel: UILabel!
    @IBOutlet var debtRatioLabel: UILabel!
    
    init?(symbolName: String?, coder: NSCoder) {
        if let symbolName = symbolName {
            self.symbolName = symbolName
        }
       
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let symbolName = symbolName {
            url = URL(string: "https://financialmodelingprep.com/api/v3/ratios/\(symbolName)?apikey=087de735c76deedab08e815ecbb5edce")
        }
        
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
                    self.ROALabel.text = "ROA: \(metrics.returnOnAssets)"
                    self.ROELabel.text = "ROE: \(metrics.returnOnEquity)"
                    self.PERLabel.text = "PER: \(metrics.priceEarningsRatio)"
                    self.PEGRLabel.text = "PEGR: \(metrics.priceEarningsToGrowthRatio)"
                    self.debtRatioLabel.text = "Debt Ratio: \(metrics.debtRatio)"
                }
                
                
            }catch {
                print(error)
            }
        }.resume()
        
    }
    
}


//let url = URL(string: "https://financialmodelingprep.com/api/v3/ratios/AAPL?apikey=087de735c76deedab08e815ecbb5edce")
