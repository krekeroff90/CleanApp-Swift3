//
//  TableScenePresenter.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableScenePresenterInput {
  func presentData(response: TableSceneResponse)
}

protocol TableScenePresenterOutput: class {
  func displayData(viewModel: TableSceneViewModel)
}

class TableScenePresenter: TableScenePresenterInput {
  
  weak var output: TableScenePresenterOutput!
  
  func presentData(response: TableSceneResponse) {
    let viewModel = TableSceneViewModel(array: response.array)
    output.displayData(viewModel: viewModel)
  }
  
}
