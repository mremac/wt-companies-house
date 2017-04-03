//
//  ViewController.swift
//  wt_companieshouse
//
//  Created by Eric Mcallister on 21/02/2017.
//  Copyright © 2017 wttech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchPersonButton: UIButton!
    @IBOutlet var searchNameButton: UIButton!
    
    @IBOutlet var inputText: UITextField!
    
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func companiesHouseServerCall(){
        var request = URLRequest(url: URL(string: "https://JMxTac4TQ-RUTsdjv3RmitADxYhHdh6VcXakx-D5:@api.companieshouse.gov.uk/search/companies")!)
        request.httpMethod = "GET"
        let postString = "?q=\(inputText.text)"
        request.httpBody = postString.data(using: .utf8)
//        request.addValue("Basic JMxTac4TQ-RUTsdjv3RmitADxYhHdh6VcXakx-D5", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                //print("statusCode should be 200, but is \(httpStatus.statusCode)")
                //print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    @IBAction func searchProductOrCompany(_ sender: Any) {
        companiesHouseServerCall();
    }
    
    @IBAction func searchPersonOrOfficer(_ sender: Any) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

