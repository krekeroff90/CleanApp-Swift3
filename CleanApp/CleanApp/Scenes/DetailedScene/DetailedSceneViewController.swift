//
//  DetailedSceneViewController.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit
import XCDYouTubeKit

protocol DetailedSceneViewControllerInput {
  func displayVideo(viewModel: DetailedSceneViewModel)
}

protocol DetailedSceneViewControllerOutput {
  var video: VideoEntity! { get set }
  func getVideoID(request: DetailedSceneRequest)
}

class DetailedSceneViewController: UIViewController, DetailedSceneViewControllerInput {
  
  @IBOutlet weak var videoContainerView: UIView!
  var videoPlayerViewController: XCDYouTubeVideoPlayerViewController!
  
  var output: DetailedSceneViewControllerOutput!
  var router: DetailedSceneRouter!
  
  /// Нстройка контроллера при старте
  override func awakeFromNib() {
    super.awakeFromNib()
    DetailedSceneConfigurator.sharedInstance.configure(viewController: self)
  }
  
  /// При полной загрузке делаем запрос данных
  override func viewDidLoad() {
    super.viewDidLoad()
    getVideoID()
  }
  
  /// Передаем запрос далее в интерактор
  func getVideoID() {
    let request = DetailedSceneRequest()
    output.getVideoID(request: request)
  }
  
  /// Данные вернулись, их можно показать в контроллере
  func displayVideo(viewModel: DetailedSceneViewModel) {
    videoPlayerViewController.present(in: videoContainerView)
    videoPlayerViewController.videoIdentifier = viewModel.videoID
    videoPlayerViewController.moviePlayer.prepareToPlay()
  }
  
}
