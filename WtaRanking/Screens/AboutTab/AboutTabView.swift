//
//  AboutTabView.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import SwiftUI

struct AboutTabView: View {
    var body: some View {
        NavigationView {
            Text(L10n.aboutBody)
                .navigationTitle(L10n.aboutHeadline)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AboutTabView_Previews: PreviewProvider {
    static var previews: some View {
        AboutTabView()
    }
}
