//
//  HiddenContainerRecognizer.swift
//  
//
//  Created by David on 2022/8/17.
//

import UIKit

/// Beware that if you add view to subview that has been pulled out from this recognizer,
/// calling getter will result in nil value.
struct HiddenContainerRecognizer {

    private enum Error: Swift.Error {
        case unsupportedOSVersion(version: Float)
        case desiredContainerNotFound(_ containerName: String)
    }

    func getHiddenContainer(from view: UIView) throws -> UIView {
        let containerName = try getHiddenContainerTypeInStringRepresentation()
        let containers = view.subviews.filter { subview in
            type(of: subview).description() == containerName
        }

        guard let container = containers.first else {
            throw Error.desiredContainerNotFound(containerName)
        }

        return container
    }

    private func getHiddenContainerTypeInStringRepresentation() throws -> String {

        if #available(iOS 15, *) {
            return "_UITextLayoutCanvasView"
        }

        if #available(iOS 14, *) {
            return "_UITextFieldCanvasView"
        }

        if #available(iOS 13, *) {
            return "_UITextFieldCanvasView"
        }

        if #available(iOS 12, *) {
            return "_UITextFieldContentView"
        }

        let currentIOSVersion = (UIDevice.current.systemVersion as NSString).floatValue
        throw Error.unsupportedOSVersion(version: currentIOSVersion)
    }
}

