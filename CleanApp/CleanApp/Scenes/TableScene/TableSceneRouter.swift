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
  
  /// Здесь можно произвести переход без использования сегвея
  func navigateToNextController() {
    
  }
  
  /// Передача данных в следующий контроллер через сегвей
  func passDataToNextScene(segue: UIStoryboardSegue) {
    /// Проверили сегвей, так как в одном роутере мы можем использовать несколько контроллеров для перехода и передачи данных
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
