//
//  ViewController.swift
//  Swift5WKWebView
//
//  Created by kamomeKUN on 2020/02/14.
// Copyright ©︎ 2020 kamomeKUN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* ToDO */
        // 大きさ
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        // なにをロードするのか
        if let url = URL(string: "https://www.yahoo.co.jp/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // ロードが開始された時
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        indicator.startAnimating()
    }
    
    // ロードが終了した時
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("読み込み完了")
        indicator.stopAnimating()
    }
    
    // 次画面に進む
    @IBAction func nextWebPage(_ sender: Any) {
        webView.goForward()
    }
    
    // 前画面に戻る
    @IBAction func prevWebPage(_ sender: Any) {
        webView.goBack()
    }
    
}

