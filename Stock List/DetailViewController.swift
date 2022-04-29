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
        tickerLabel.text = stock?.symbol
        Namelabel.text = stock?.name
        PriceLabel.text = stock?.price.formatted()
        ExchangeLabel.text = stock?.exchange
        TypeLabel.text = stock?.type
    }
    

    
    
    @IBAction func onClickMetrics(_ sender: Any) {
        
    }
    

}
