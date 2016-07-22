//
//  YoutubeManager.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright © 2016 InstaRobot.NET. All rights reserved.
//

import Foundation
import UIKit

class YoutubeManager {
  
  /// Singlton for YoutubeManager Class
  static let sharedInstance = YoutubeManager()
  
  /**
   Get videos from playlist
   - parameter playlistID: ID for playlist (as String!)
   */
  func getVideosForChannelWithPlaylistID(playlistID: String!, completion: (array: Array<VideoEntity>) -> Void) {
    let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails&maxResults=50&playlistId=\(playlistID)&key=\(Config.GoogleDataKey)"
    let targetURL = NSURL(string: urlString)
    performGetRequest(targetURL: targetURL) { data, HTTPStatusCode, error -> Void in
      if HTTPStatusCode == 200 && error == nil {
        do {
          let resultsDict = try JSONSerialization.jsonObject(with: data! as Data, options: []) as! Dictionary<NSObject, AnyObject>
          let items: Array<Dictionary<NSObject, AnyObject>> = resultsDict["items"] as! Array<Dictionary<NSObject, AnyObject>>
          var array = Array<VideoEntity>()
          for i in 0 ..< items.count {
            let playlistSnippetDict = (items[i] as Dictionary<NSObject, AnyObject>)["snippet"] as! Dictionary<NSObject, AnyObject>
            if (playlistSnippetDict["thumbnails"] as? Dictionary<NSObject, AnyObject>) != nil {
              let publishedAt = playlistSnippetDict["publishedAt"] as! String!
              let title = playlistSnippetDict["title"] as! String!
              let description = playlistSnippetDict["description"] as! String!
              let videoID = (playlistSnippetDict["resourceId"] as! Dictionary<NSObject, AnyObject>)["videoId"] as! String!
              let thumbnail = ((playlistSnippetDict["thumbnails"] as! Dictionary<NSObject, AnyObject>)["default"] as! Dictionary<NSObject, AnyObject>)["url"] as! String!
              let videoItem = VideoEntity(publishedAt: publishedAt, title: title, description: description, videoID: videoID, thumbnail: thumbnail)
              array.append(videoItem)
            } else {
              continue
            }
          }
          completion(array: array)
        } catch {
          completion(array: [])
        }
      } else {completion(array: [])}
    }
  } // getVideosForChannelWithPlaylistID
  
} // class DataAPI

/// Helper for perform data request
extension YoutubeManager {
  /**
   Perform "GET" request to YouTube service
   - parameter targetURL:  url for request (NSURL!)
   - parameter completion: completion handler block
   */
  private func performGetRequest(targetURL: NSURL!, completion: (data: NSData?, HTTPStatusCode: Int, error: NSError?) -> Void) {
    let request = NSMutableURLRequest(url: targetURL as URL)
    request.httpMethod = "GET"
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)
    let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
      DispatchQueue.main.async(execute: { () -> Void in
        completion(data: data, HTTPStatusCode: (response as! HTTPURLResponse).statusCode, error: error)
      })
    })
    task.resume()
  } // performGetRequest
  
} // extension YoutubeManager
