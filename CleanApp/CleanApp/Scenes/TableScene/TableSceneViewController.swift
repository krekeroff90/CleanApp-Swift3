//
//  TableSceneViewController.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableSceneViewControllerInput {
  func displaySomething(viewModel: TableSceneViewModel)
}

protocol TableSceneViewControllerOutput {
  func doSomething(request: TableSceneRequest)
}

class TableSceneViewController: UITableViewController, TableSceneViewControllerInput {
  var output: TableSceneViewControllerOutput!
  var router: TableSceneRouter!
  // MARK: Object lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
    TableSceneConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
  }
  
  // MARK: Event handling
  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work
    let request = TableSceneRequest()
    output.doSomething(request: request)
  }
  
  // MARK: Display logic
  func displaySomething(viewModel: TableSceneViewModel) {
    // NOTE: Display the result from the Presenter
    // nameTextField.text = viewModel.name
  }
  
}
