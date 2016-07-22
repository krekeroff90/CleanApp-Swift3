//
//  DetailedScenePresenter.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol DetailedScenePresenterInput {
  func presentSomething(response: DetailedSceneResponse)
}

protocol DetailedScenePresenterOutput: class {
  func displaySomething(viewModel: DetailedSceneViewModel)
}

class DetailedScenePresenter: DetailedScenePresenterInput {
  
  weak var output: DetailedScenePresenterOutput!
  // MARK: Presentation logic
  func presentSomething(response: DetailedSceneResponse) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    let viewModel = DetailedSceneViewModel()
    output.displaySomething(viewModel: viewModel)
  }
  
}
