//
//  SearchSettingViewController.swift
//  GithubDemo
//
//  Created by Jason Wong on 3/1/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingViewController: UIViewController {

    @IBOutlet weak var numberOfStarsSlider: UISlider!
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    
    var settings = GithubRepoSearchSettings()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

    numberOfStarsSlider.value = Float(settings.minStars)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.settings.minStars = Int(numberOfStarsSlider.value)
        self.delegate?.didSaveSettings(settings: settings)
        dismiss(animated: true, completion: nil)
        
        
    
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.didCancelSettings()
        dismiss(animated: true, completion: nil)
    }

    

}

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}
