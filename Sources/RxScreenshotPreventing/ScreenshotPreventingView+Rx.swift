//
//  ScreenshotPreventingView+Rx.swift
//  
//
//  Created by David on 2022/8/17.
//

import RxSwift
import ScreenshotPreventing
import RxCocoa

extension Reactive where Base: ScreenshotPreventingView {

    var preventScreenCapture: Binder<Bool> {
        Binder(base) { view, value in
            view.preventScreenCapture = value
        }
    }
}
