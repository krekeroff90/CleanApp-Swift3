//
//  TableSceneConfigurator.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

extension TableSceneViewController: TableScenePresenterOutput {
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    router.passDataToNextScene(segue: segue)
  }
}

extension TableSceneInteractor: TableSceneViewControllerOutput {}
extension TableScenePresenter: TableSceneInteractorOutput {}

class TableSceneConfigurator {
  
  class var sharedInstance: TableSceneConfigurator {
    return TableSceneConfigurator()
  }
  
  func configure(viewController: TableSceneViewController) {
    
    let router = TableSceneRouter()
    router.viewController = viewController
    
    let presenter = TableScenePresenter()
    presenter.output = viewController
    
    let interactor = TableSceneInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
  
}
