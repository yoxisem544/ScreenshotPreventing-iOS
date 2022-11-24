//
//  ScreenshotPreventingView+Rx.swift
//
//
//  Created by David on 2022/8/17.
//

import RxCocoa
import RxSwift

#if !COCOAPODS
import ScreenshotPreventing
#endif

extension Reactive where Base: ScreenshotPreventingView {

    var preventScreenCapture: Binder<Bool> {
        Binder(base) { view, value in
            view.preventScreenCapture = value
        }
    }
}
