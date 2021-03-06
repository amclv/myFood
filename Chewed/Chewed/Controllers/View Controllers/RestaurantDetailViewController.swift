//
//  RestaurantDetailViewController.swift
//  FoodieFun
//
//  Created by Aaron Cleveland on 2/9/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: ShiftableViewController {
    
    @IBOutlet weak var restaurantNameTextField: UITextField!
    @IBOutlet weak var cuisineNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextView!
    @IBOutlet weak var hoursTextView: UITextView!
    
    var restaurant: Restaurant?
    var restaurantController: RestaurantController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantNameTextField.delegate = self
        cuisineNameTextField.delegate = self
        locationTextField.delegate = self
        ratingTextField.delegate = self
        reviewTextField.delegate = self
        hoursTextView.delegate = self
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        restaurantNameTextField.text = restaurant?.name ?? ""
        locationTextField.text = restaurant?.location
        hoursTextView.text = restaurant?.hoursOfOperation
        restaurant?.createdBy = "iostest"
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveRestaurant()
        dismiss(animated: true, completion: nil)
    }
    
    func saveRestaurant() {
        guard let restaurantName = restaurantNameTextField.text,
            !restaurantName.isEmpty,
            let location = locationTextField.text,
            !location.isEmpty,
            let hours = hoursTextView.text,
            !hours.isEmpty else { return }
        if let restaurant = restaurant {
            let newRest = RestaurantRepresentation(id: 0,
                                                   name: restaurantName,
                                                   cuisineID: 0,
                                                   location: location,
                                                   hoursOfOperation: hours,
                                                   imgURL: "",
                                                   createdBy: "",
                                                   createdAt: "",
                                                   updatedAt: "")
            restaurantController?.updateX(oldRest: restaurant,
                                          newRest: newRest)
            
        } else {
            let newRest = RestaurantRepresentation(id: 0,
                                                   name: restaurantName,
                                                   cuisineID: 0,
                                                   location: location,
                                                   hoursOfOperation: hours,
                                                   imgURL: "",
                                                   createdBy: "",
                                                   createdAt: "",
                                                   updatedAt: "")
            restaurantController?.createRestaurant(createRep: newRest)
            print("this is adding a restaurant")
        }
    }
}

extension RestaurantDetailViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.endEditing(true)
        return true
    }
    
}
