//
//  DetailedSceneInteractor.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol DetailedSceneInteractorInput {
  var video: VideoEntity! { get set }
  func getVideoID(request: DetailedSceneRequest)
}

protocol DetailedSceneInteractorOutput {
  func presentVideo(response: DetailedSceneResponse)
}

class DetailedSceneInteractor: DetailedSceneInteractorInput {
  
  var output: DetailedSceneInteractorOutput!
  var video: VideoEntity!
  
  /// Показали, что был послан запрос и обрабатываем результат
  func getVideoID(request: DetailedSceneRequest) {
    let response = DetailedSceneResponse(video: video)
    output.presentVideo(response: response)
  }
  
}
