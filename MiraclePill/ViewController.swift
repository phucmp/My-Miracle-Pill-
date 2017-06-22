//
//  ViewController.swift
//  MiraclePill
//
//  Created by Paul Minh Pham on 6/21/17.
//  Copyright © 2017 Paul Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var StatePicker: UIPickerView!
    @IBOutlet weak var StatePickerBtn: UIButton!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var CountryText: UITextField!
    @IBOutlet weak var Zip: UILabel!
    @IBOutlet weak var ZipText: UITextField!
    @IBOutlet weak var BuyBtn: UIButton!
    @IBOutlet weak var SuccessImg: UIImageView!

    
    let states = ["Alaska",
                  "Alabama",
                  "Arkansas",
                  "American Samoa",
                  "Arizona",
                  "California",
                  "Colorado",
                  "Connecticut",
                  "District of Columbia",
                  "Delaware",
                  "Florida",
                  "Georgia",
                  "Guam",
                  "Hawaii",
                  "Iowa",
                  "Idaho",
                  "Illinois",
                  "Indiana",
                  "Kansas",
                  "Kentucky",
                  "Louisiana",
                  "Massachusetts",
                  "Maryland",
                  "Maine",
                  "Michigan",
                  "Minnesota",
                  "Missouri",
                  "Mississippi",
                  "Montana",
                  "North Carolina",
                  " North Dakota",
                  "Nebraska",
                  "New Hampshire",
                  "New Jersey",
                  "New Mexico",
                  "Nevada",
                  "New York",
                  "Ohio",
                  "Oklahoma",
                  "Oregon",
                  "Pennsylvania",
                  "Puerto Rico",
                  "Rhode Island",
                  "South Carolina",
                  "South Dakota",
                  "Tennessee",
                  "Texas",
                  "Utah",
                  "Virginia",
                  "Virgin Islands",
                  "Vermont",
                  "Washington",
                  "Wisconsin",
                  "West Virginia",
                  "Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StatePicker.dataSource = self
        StatePicker.delegate = self
        nameText.delegate = self
        addressText.delegate = self
        cityText.delegate = self
        CountryText.delegate = self
        ZipText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        StatePicker.isHidden = false
        Country.isHidden = true
        CountryText.isHidden = true
        Zip.isHidden = true
        ZipText.isHidden = true
        BuyBtn.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        StatePickerBtn.setTitle(states[row], for: UIControlState.normal)
        StatePicker.isHidden = true
        Country.isHidden = false
        CountryText.isHidden = false
        Zip.isHidden = false
        ZipText.isHidden = false
        BuyBtn.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func BuyBtnPressed(_ sender: Any) {
        var full = true
        for textfield in [nameText, addressText, cityText, CountryText, ZipText] {
            if textfield?.text == "" {
                full = false
                break
            }
        }
        
        if full == true {
            for view in self.view.subviews as [UIView]{
                view.isHidden = true
            }
            SuccessImg.isHidden = false
        }
    }
    
}

