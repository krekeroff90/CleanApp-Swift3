//
//  DetailedScenePresenter.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol DetailedScenePresenterInput {
  func presentVideo(response: DetailedSceneResponse)
}

protocol DetailedScenePresenterOutput: class {
  func displayVideo(viewModel: DetailedSceneViewModel)
}

class DetailedScenePresenter: DetailedScenePresenterInput {
  
  weak var output: DetailedScenePresenterOutput!
  
  func presentVideo(response: DetailedSceneResponse) {
    let viewModel = DetailedSceneViewModel(videoID: response.video.videoID)
    output.displayVideo(viewModel: viewModel)
  }
  
}
