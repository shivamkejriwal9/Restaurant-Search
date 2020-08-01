//
//  DetailView.swift
//  Zomato Clone
//
//  Created by Shivam Kejriwal on 01/08/20.
//  Copyright © 2020 Shivam Kejriwal. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url = ""
    var name = ""
    
    var body: some View {
        WebView(url: url).navigationBarTitle(name)
    }
}

struct WebView : UIViewRepresentable {
    
    var url = ""
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        let web = WKWebView()
        web.load(URLRequest(url: URL(string: url)!))
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
