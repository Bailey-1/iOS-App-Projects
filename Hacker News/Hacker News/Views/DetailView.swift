//
//  DetailView.swift
//  Hacker News
//
//  Created by Bailey Search on 07/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import SwiftUI
import WebKit


struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.co.uk")
    }
}
