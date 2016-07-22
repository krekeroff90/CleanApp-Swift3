//
//  DetailedSceneInteractor.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol DetailedSceneInteractorInput {
  func doSomething(request: DetailedSceneRequest)
}

protocol DetailedSceneInteractorOutput {
  func presentSomething(response: DetailedSceneResponse)
}

class DetailedSceneInteractor: DetailedSceneInteractorInput {
  var output: DetailedSceneInteractorOutput!
  var worker: DetailedSceneWorker!
  // MARK: Business logic
  func doSomething(request: DetailedSceneRequest) {
    // NOTE: Create some Worker to do the work
    worker = DetailedSceneWorker()
    worker.doSomeWork()
    // NOTE: Pass the result to the Presenter
    let response = DetailedSceneResponse()
    output.presentSomething(response: response)
  }
  
}
