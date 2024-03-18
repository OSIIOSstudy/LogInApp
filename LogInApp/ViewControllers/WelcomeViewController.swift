//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by OSIIOSdev on 13.03.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet var welcomeLabel: UILabel!
    
    // MARK: - Properties
    var user = ""
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(user)!"
    }
}
