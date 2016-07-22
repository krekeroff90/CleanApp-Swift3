//
//  TableSceneInteractor.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableSceneInteractorInput {
  func doSomething(request: TableSceneRequest)
}

protocol TableSceneInteractorOutput {
  func presentSomething(response: TableSceneResponse)
}

class TableSceneInteractor: TableSceneInteractorInput {
  
  var output: TableSceneInteractorOutput!
  var worker: TableSceneWorker!
  // MARK: Business logic
  func doSomething(request: TableSceneRequest) {
    // NOTE: Create some Worker to do the work
    worker = TableSceneWorker()
    worker.doSomeWork()
    // NOTE: Pass the result to the Presenter
    let response = TableSceneResponse()
    output.presentSomething(response: response)
  }
  
}
