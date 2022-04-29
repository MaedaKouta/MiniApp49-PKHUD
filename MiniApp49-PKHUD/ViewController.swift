//
//  ViewController.swift
//  MiniApp49-PKHUD
//
//  Created by 前田航汰 on 2022/04/29.
//

import UIKit
import WebKit
import PKHUD

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet private var webView: WKWebView!
    private let urlString = "https://apple.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        HUD.dimsBackground = true
        HUD.show(.progress, onView: view)

        if let url = URL(string: urlString) {
            self.webView.load(URLRequest(url: url))
        } else {
            print("URLが取得できませんでした。")
        }
    }


    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
    }

    // MARK: - 読み込み完了
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("読み込み完了")
        HUD.hide(animated: true)
    }


}

