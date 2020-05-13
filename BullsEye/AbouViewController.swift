//
//  AbouViewController.swift
//  BullsEye
//
//  Created by Mikhail Chukhvantsev on 23/03/2019.
//  Copyright © 2019 Mikhail Chukhvantsev. All rights reserved.
//

import UIKit
import WebKit

class AbouViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!

  override func viewDidLoad() {
    super.viewDidLoad()

    if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
      let url = URL(fileURLWithPath: htmlPath)
      let request = URLRequest(url: url)
      webView.load(request)
    }
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }

}
