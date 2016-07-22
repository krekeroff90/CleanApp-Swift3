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
  
  override func awakeFromNib() {
    super.awakeFromNib()
    DetailedSceneConfigurator.sharedInstance.configure(viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getVideoID()
  }
  
  func getVideoID() {
    let request = DetailedSceneRequest()
    output.getVideoID(request: request)
  }
  
  func displayVideo(viewModel: DetailedSceneViewModel) {
    videoPlayerViewController.present(in: videoContainerView)
    videoPlayerViewController.videoIdentifier = viewModel.videoID
    videoPlayerViewController.moviePlayer.prepareToPlay()
  }
  
}
