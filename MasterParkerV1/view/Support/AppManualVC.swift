//
//  AppManualVC.swift
//  MasterParkerV1
//
//  Created by Moiz Khan on 11/28/19.
//  Copyright © 2019 MR. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class AppManualVC: UIViewController, WKUIDelegate{
    
    @IBOutlet var webView: WKWebView!

     
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            let url = Bundle.main.url(forResource: "Index", withExtension: "html")
            let requestObj = URLRequest(url: url!);
            webView.load(requestObj);
        }
        
        override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
}
