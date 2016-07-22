//
//  TableSceneModels.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

/// Модель данных, специфичная для данного контроллера

/// Общий запрос
struct TableSceneRequest {}
/// Формат ответа
struct TableSceneResponse {
  var array = Array<VideoEntity>()
}
/// Модель представления
struct TableSceneViewModel {
  var array = Array<VideoEntity>()
}
