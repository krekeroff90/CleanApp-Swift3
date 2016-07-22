//
//  DetailedSceneConfigurator.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit
import XCDYouTubeKit

extension DetailedSceneViewController: DetailedScenePresenterOutput {
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    router.passDataToNextScene(segue: segue)
  }
}

extension DetailedSceneInteractor: DetailedSceneViewControllerOutput {}
extension DetailedScenePresenter: DetailedSceneInteractorOutput {}

class DetailedSceneConfigurator {
  
  class var sharedInstance: DetailedSceneConfigurator {
    return DetailedSceneConfigurator()
  }
  
  func configure(viewController: DetailedSceneViewController) {
    
    let router = DetailedSceneRouter()
    router.viewController = viewController
    
    let presenter = DetailedScenePresenter()
    presenter.output = viewController
    
    let interactor = DetailedSceneInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
    
    viewController.videoPlayerViewController = XCDYouTubeVideoPlayerViewController()
  }
  
}
