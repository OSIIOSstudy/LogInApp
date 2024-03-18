//
//  ViewController.swift
//  LogInApp
//
//  Created by OSIIOSdev on 13.03.2024.
//

import UIKit

final class LogInViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotLogInButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    // MARK: - Properties
    var username = "OSIIOSdev"
    var password = "!15A081991bc"
        
    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            guard let welcomeVC = viewController as? WelcomeViewController else { return }
            welcomeVC.user = username
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - @IBAction Methods
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case logInButton:
            guard usernameTextField.text == username, passwordTextField.text == password else {
                showAlertController(title: "Invalid login or password", message: "Please enter correct login and password")
                passwordTextField.text = ""
                
                return
            }
        case forgotLogInButton:
            showAlertController(title: "Opps..", message: "Your name is \(username) 😉")
        case forgotPasswordButton:
            showAlertController(title: "Opps..", message: "Your password is \(password) 😉")
        default:
            return
        }
    }
    
    // MARK: - Private Methods
    private func showAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

