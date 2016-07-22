//
//  TableScenePresenter.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableScenePresenterInput {
  func presentSomething(response: TableSceneResponse)
}

protocol TableScenePresenterOutput: class {
  func displaySomething(viewModel: TableSceneViewModel)
}

class TableScenePresenter: TableScenePresenterInput {
  
  weak var output: TableScenePresenterOutput!
  // MARK: Presentation logic
  func presentSomething(response: TableSceneResponse) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    let viewModel = TableSceneViewModel()
    output.displaySomething(viewModel: viewModel)
  }
  
}
