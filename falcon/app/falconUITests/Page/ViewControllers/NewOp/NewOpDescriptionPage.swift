//
//  NewOpDescriptionPage.swift
//  falconUITests
//
//  Created by Juan Pablo Civile on 25/02/2019.
//  Copyright © 2019 muun. All rights reserved.
//

import Foundation
import XCTest

final class NewOpDescriptionPage: UIElementPage<UIElements.Pages.NewOp.DescriptionView> {

    private lazy var input = self.textView(.input)

    init() {
        super.init(root: Root.root)
    }

    func enter(description: String) {
        input.tap()
        UIPasteboard.general.string = description
        if !XCUIApplication().menuItems["Paste"].exists {
            input.doubleTap()
        }
        XCUIApplication().menuItems["Paste"].tap()
    }

    func description() -> String {
        // swiftlint:disable force_cast
        return input.value as! String
        // swiftlint:enable force_cast
    }
}
