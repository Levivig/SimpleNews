//
//  FavoritesEmptyView.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 06..
//  Copyright © 2020. levivig. All rights reserved.
//

import Lottie
import SwiftUI
import UIKit

struct EmptyView: View {

    @State var isAnimating: Bool
    
    var body: some View {
        VStack {
            BookmarkAnimView(isAnimating: $isAnimating).frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("NoFavorites".localized)
                .foregroundColor(.secondary)
                .font(.subheadline)
        }.onAppear(perform: {
            isAnimating = true
        }).onDisappear(perform: {
            isAnimating = false
        })
    }
}

struct BookmarkAnimView: UIViewRepresentable {
    
    typealias UIViewType = AnimationView
    @Binding var isAnimating: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let animationView = AnimationView()
        animationView.animation = Animation.named("bookmark_anim")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        if isAnimating {
            uiView.play()
        } else {
            uiView.stop()
        }
    }
}

struct EmptyView_previews: PreviewProvider {
    static var previews: some View {
        EmptyView(isAnimating: true)
    }
}
