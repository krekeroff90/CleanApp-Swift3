//
//  DetailedSceneRouter.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol DetailedSceneRouterInput {
  func navigateToNextController()
}

class DetailedSceneRouter: DetailedSceneRouterInput {
  
  weak var viewController: DetailedSceneViewController!

  func navigateToNextController() {

  }
  
  func passDataToNextScene(segue: UIStoryboardSegue) {
    if segue.identifier == "OtherScene" {
      
    }
  }

}
