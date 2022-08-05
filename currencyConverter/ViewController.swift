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
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        
                        DispatchQueue.main.async {
                            
                            if let rates = jsonResponse ["rates"] as? [String : Any]{
                                
                                if let aed = rates["AED"] as? Double{
                                    self.aedLabel.text = "AED: \(aed)"
                                }
                                if let ang = rates["ANG"] as? Double{
                                    self.angLabel.text = "ANG: \(ang)"
                                }
                                if let ars = rates["ARS"] as? Double{
                                    self.arsLabel.text = "ARS: \(ars)"
                                }
                                if let bam = rates["BAM"] as? Double{
                                    self.bamLabel.text = "BAM: \(bam)"
                                }
                                if let bdt = rates["BDT"] as? Double{
                                    self.bdtLabel.text = "BDT: \(bdt)"
                                }
                                if let bhd = rates["BHD"] as? Double{
                                    self.bhdLabel.text = "BHD: \(bhd)"
                                }
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let cny = rates["CNY"] as? Double{
                                    self.cnyLabel.text = "CNY: \(cny)"
                                }
                                if let dkk = rates["DKK"] as? Double{
                                    self.dkkLabel.text = "DKK: \(dkk)"
                                }
                                if let eur = rates["EUR"] as? Double{
                                    self.eurLabel.text = "EUR: \(eur)"
                                }
                                if let gel = rates["GEL"] as? Double{
                                    self.gelLabel.text = "GEL: \(gel)"
                                }
                                if let gmd = rates["GMD"] as? Double{
                                    self.gmdLabel.text = "GMD: \(gmd)"
                                }
                                if let gyd = rates["GYD"] as? Double{
                                    self.gydLabel.text = "GYD: \(gyd)"
                                }
                                if let hkd = rates["HKD"] as? Double{
                                    self.hkdLabel.text = "HKD: \(hkd)"
                                }
                                if let jep = rates["JEP"] as? Double{
                                    self.jepLabel.text = "jep: \(jep)"
                                }
                                if let kes = rates["KES"] as? Double{
                                    self.kesLabel.text = "KES: \(kes)"
                                }
                                if let kgs = rates["KGS"] as? Double{
                                    self.kgsLabel.text = "KGS: \(kgs)"
                                }
                                if let kpw = rates["KPW"] as? Double{
                                    self.kpwLabel.text = "KPW: \(kpw)"
                                }
                                if let kzt = rates["KZT"] as? Double{
                                    self.kztLabel.text = "KZT: \(kzt)"
                                }
                                if let lkr = rates["LKR"] as? Double{
                                    self.lkrLabel.text = "LKR: \(lkr)"
                                }
                                if let lrd = rates["LRD"] as? Double{
                                    self.lrdLabel.text = "LRD: \(lrd)"
                                }
                                if let omr = rates["OMR"] as? Double{
                                    self.omrLabel.text = "OMR: \(omr)"
                                }
                                if let vuv = rates["VUV"] as? Double{
                                    self.vuvLabel.text = "VUV: \(vuv)"
                                }
                                print("succes!")
                                
                            }
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

