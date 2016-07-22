//
//  TableSceneRouter.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableSceneRouterInput {
  func navigateToNextController()
}

class TableSceneRouter: TableSceneRouterInput {
  
  weak var viewController: TableSceneViewController!
  
  func navigateToNextController() {
    // Здесь можно произвести переход без использования сегвея
  }
  
  func passDataToNextScene(segue: UIStoryboardSegue) {
    if segue.identifier == "ShowDetailedScene" {
      if let selectedIndexPath = viewController.tableView.indexPathForSelectedRow {
        if let selectedVideo = viewController.output.videos?[(selectedIndexPath as NSIndexPath).row] {
          let detailedViewController = segue.destinationViewController as! DetailedSceneViewController
          detailedViewController.output.video = selectedVideo
        }
      }
    }
  }

}
