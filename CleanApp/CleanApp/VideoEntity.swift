//
//  VideoEntity.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright © 2016 InstaRobot.NET. All rights reserved.
//

import Foundation

class VideoEntity {
  
  var publishedAt: String!
  var title: String!
  var description: String!
  var videoID: String!
  var thumbnail: String!
  
  init(publishedAt: String!, title: String!, description: String!, videoID: String!, thumbnail: String!) {
    self.publishedAt = publishedAt
    self.title       = title
    self.description = description
    self.videoID     = videoID
    self.thumbnail   = thumbnail
  }
  
}
