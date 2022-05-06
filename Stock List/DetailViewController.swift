//
//  DetailViewController.swift
//  Stock List
//
//  Created by Luis Madriz on 4/28/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var tickerLabel: UILabel!
    @IBOutlet var Namelabel: UILabel!
    @IBOutlet var PriceLabel: UILabel!
    @IBOutlet var ExchangeLabel: UILabel!
    @IBOutlet var TypeLabel: UILabel!
    
    
    var stock: StockList? 

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let stock = stock else {
            return
        }

        tickerLabel.text = stock.symbol
        Namelabel.text = stock.name
        //PriceLabel.text = stock?.price.formatted()
        PriceLabel.text = currencyFormatter(number: stock.price)
        ExchangeLabel.text = stock.exchange
        TypeLabel.text = stock.type
    }
    

    
    
    @IBAction func onClickMetrics(_ sender: Any) {
        print("Holaaaaaa!!!!!")
    }
    @IBSegueAction func segueToKeyMetrics(_ coder: NSCoder) -> KeyMetricsViewController? {
        let vc = KeyMetricsViewController(symbolName: stock?.symbol, coder: coder)
        return vc
    }
    
    func currencyFormatter(number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        return numberFormatter.string(from: NSNumber(value: number)) ?? "N/A"
    }

}
