//
//  DetailedSceneViewController.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol DetailedSceneViewControllerInput {
  func displaySomething(viewModel: DetailedSceneViewModel)
}

protocol DetailedSceneViewControllerOutput {
  func doSomething(request: DetailedSceneRequest)
}

class DetailedSceneViewController: UIViewController, DetailedSceneViewControllerInput {
  var output: DetailedSceneViewControllerOutput!
  var router: DetailedSceneRouter!
  
  // MARK: Object lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
    DetailedSceneConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
  }
  
  // MARK: Event handling
  
  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work
    let request = DetailedSceneRequest()
    output.doSomething(request: request)
  }
  
  // MARK: Display logic
  
  func displaySomething(viewModel: DetailedSceneViewModel) {
    // NOTE: Display the result from the Presenter
    // nameTextField.text = viewModel.name
  }
  
}
