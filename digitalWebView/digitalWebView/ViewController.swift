//
//  ViewController.swift
//  digitalWebView
//
//  Created by Ceren ÇABIK on 18.03.2024.
//

import UIKit
import WebKit

class ViewController: UIViewController{

    @IBOutlet weak var act: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInitView()
        
    }
    
    private func setInitView(){
        webView.navigationDelegate = self
        let loadUrl = "https://studiodijital.com/"
        let url = URL(string: loadUrl)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}

extension ViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        act.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        act.stopAnimating()
    }
    
    
}

