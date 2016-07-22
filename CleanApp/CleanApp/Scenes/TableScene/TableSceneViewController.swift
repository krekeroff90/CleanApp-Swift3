//
//  TableSceneViewController.swift
//  CleanApp
//
//  Created by Vitaliy Podolskiy on 22/07/2016.
//  Copyright (c) 2016 InstaRobot.NET. All rights reserved.
//

import UIKit

protocol TableSceneViewControllerInput {
  func displayData(viewModel: TableSceneViewModel)
}

protocol TableSceneViewControllerOutput {
  func doRequest(request: TableSceneRequest)
  var videos: [VideoEntity]? { get }
}

class TableSceneViewController: UITableViewController, TableSceneViewControllerInput {
  
  var output: TableSceneViewControllerOutput!
  var router: TableSceneRouter!
  var videoArray: Array<VideoEntity>! = []
  
  /// Нстройка контроллера при старте
  override func awakeFromNib() {
    super.awakeFromNib()
    TableSceneConfigurator.sharedInstance.configure(viewController: self)
  }
  
  /// При полной загрузке делаем запрос данных
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  /// Передаем запрос далее в интерактор
  func loadData() {
    let request = TableSceneRequest()
    output.doRequest(request: request)
  }
  
  /// Данные вернулись, их можно показать в контроллере
  func displayData(viewModel: TableSceneViewModel) {
    self.videoArray = viewModel.array
    tableView.reloadData()
  }
  
  // MARK: TableView DataSource
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videoArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let videoitem = videoArray[(indexPath as IndexPath).row]
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    cell?.textLabel?.text = videoitem.title
    cell?.detailTextLabel?.text = videoitem.description
    return cell!
  }
  
}















