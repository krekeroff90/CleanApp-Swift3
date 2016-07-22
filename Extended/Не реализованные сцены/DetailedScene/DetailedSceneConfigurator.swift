//
//  DetailedSceneConfigurator.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension DetailedSceneViewController: DetailedScenePresenterOutput {
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    router.passDataToNextScene(segue: segue)
  }
}

extension DetailedSceneInteractor: DetailedSceneViewControllerOutput {}
extension DetailedScenePresenter: DetailedSceneInteractorOutput {}

class DetailedSceneConfigurator {
  // MARK: Object lifecycle
  class var sharedInstance: DetailedSceneConfigurator {
    return DetailedSceneConfigurator()
  }
  
  // MARK: Configuration
  func configure(viewController: DetailedSceneViewController) {
    
    let router = DetailedSceneRouter()
    router.viewController = viewController
    
    let presenter = DetailedScenePresenter()
    presenter.output = viewController
    
    let interactor = DetailedSceneInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
  
}
