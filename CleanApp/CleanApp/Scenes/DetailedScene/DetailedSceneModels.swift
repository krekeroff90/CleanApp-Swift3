//
//  DetailedSceneModels.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

/// Модель данных, специфичная для данного контроллера

/// Общий запрос
struct DetailedSceneRequest {}
/// Формат ответа
struct DetailedSceneResponse {
  var video: VideoEntity
}
/// Модель представления
struct DetailedSceneViewModel {
  var videoID: String!
}
