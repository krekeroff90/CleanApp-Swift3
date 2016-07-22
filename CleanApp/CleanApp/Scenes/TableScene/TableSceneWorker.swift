//
//  TableSceneWorker.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

class TableSceneWorker {
  
  /// Наш сервис обращается к менеджеру и позвращает результат в интерактор
  func loadList(callback: (videos: Array<VideoEntity>) -> Void) {
    let playlistID = VideoPlaylist()
    YoutubeManager.sharedInstance.getVideosForChannelWithPlaylistID(playlistID: playlistID) { array -> Void in
      callback(videos: array)
    }
  }
  
}
