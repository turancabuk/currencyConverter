//
//  ViewController.swift
//  currencyConverter
//
//  Created by Turan Çabuk on 28.07.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var aedLabel: UILabel!
    @IBOutlet weak var angLabel: UILabel!
    @IBOutlet weak var arsLabel: UILabel!
    @IBOutlet weak var bamLabel: UILabel!
    @IBOutlet weak var bdtLabel: UILabel!
    @IBOutlet weak var bhdLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var cnyLabel: UILabel!
    @IBOutlet weak var dkkLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var gelLabel: UILabel!
    @IBOutlet weak var gmdLabel: UILabel!
    @IBOutlet weak var gydLabel: UILabel!
    @IBOutlet weak var hkdLabel: UILabel!
    @IBOutlet weak var jepLabel: UILabel!
    @IBOutlet weak var kesLabel: UILabel!
    @IBOutlet weak var kgsLabel: UILabel!
    @IBOutlet weak var kpwLabel: UILabel!
    @IBOutlet weak var kztLabel: UILabel!
    @IBOutlet weak var lkrLabel: UILabel!
    @IBOutlet weak var lrdLabel: UILabel!
    @IBOutlet weak var omrLabel: UILabel!
    @IBOutlet weak var vuvLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func ratesButtonClicked(_ sender: Any) {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if error != nil{
                let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                    
                    }catch{
                        print("error!")
                    }
                }
            }
        }
        task.resume()
   
    }
    
}

