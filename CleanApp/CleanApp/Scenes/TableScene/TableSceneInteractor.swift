//
//  TableSceneInteractor.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableSceneInteractorInput {
  func doRequest(request: TableSceneRequest)
  var videos: [VideoEntity]? { get }
}

protocol TableSceneInteractorOutput {
  func presentData(response: TableSceneResponse)
}

class TableSceneInteractor: TableSceneInteractorInput {
  
  var output: TableSceneInteractorOutput!
  var worker: TableSceneWorker!
  var videos: [VideoEntity]?
  
  func doRequest(request: TableSceneRequest) {
    worker = TableSceneWorker()
    worker.loadList { videos -> Void in
      self.videos = videos
      let response = TableSceneResponse(array: self.videos!)
      self.output.presentData(response: response)
    }
  }
  
}
