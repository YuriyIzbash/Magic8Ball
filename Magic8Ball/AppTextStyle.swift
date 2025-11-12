//
//  AppTextStyle.swift
//  Magic8Ball
//
//  Created by yuriy on 12. 11. 25.
//
import SwiftUI

struct AppTextStyle: ViewModifier {
    let fontSize: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom("Magic School One", size: fontSize))
            .foregroundColor(.white)
            .frame(width: frameWidth, height: frameHeight)
            .multilineTextAlignment(.center)
            .padding(.bottom, bottomPadding)
            .padding(.horizontal, horizontalPadding)
    }

    private var frameWidth: CGFloat {
        #if os(watchOS)
        return 36
        #else
        return 90
        #endif
    }

    private var frameHeight: CGFloat {
        #if os(watchOS)
        return 36
        #else
        return 90
        #endif
    }

    private var bottomPadding: CGFloat {
        #if os(watchOS)
        return 20
        #else
        return 30
        #endif
    }

    private var horizontalPadding: CGFloat {
        #if os(watchOS)
        return 8
        #else
        return 12
        #endif
    }
}

extension View {
    func magicBallTextStyle(size: CGFloat) -> some View {
        modifier(AppTextStyle(fontSize: size))
    }
}
