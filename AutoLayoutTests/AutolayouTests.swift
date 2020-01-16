//
//  AutolayouTests.swift
//  AutolayouTests
//
//  Created by Hassan Shahbazi on 25.12.2019.
//  Copyright © 2019 Hassan Shahbazi. All rights reserved.
//

import XCTest
@testable import AutoLayout

class AutolayouTests: XCTestCase {
    var superView: UIView!
    var view: UIView!
    
    override func setUp() {
        superView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        view = UIView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
        
        superView.addSubview(view)
    }

    override func tearDown() {
        superView.removeConstraints(superView.constraints)
        view.removeConstraints(view.constraints)
    }

    func testAutolayouSize() {
        view.fix(width: 150, height: 170)
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.width, 150)
        XCTAssertEqual(view.frame.height, 170)
    }
    
    func testAutolayouOrigin() {
        view.fix(left: (30, superView), isRelative: false)
        view.fix(top: (10, superView), isRelative: false)
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()

        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 30)
    }
    
    func testAutolayoutOriginActivate() {
        view
            .fix(top: (10, superView), isRelative: false)
            .fix(left: (30, superView), isRelative: false)
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        view.deactivate(origin: [.leading])
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 0)
        
        view.fix(left: (30, superView), isRelative: false)
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 30)
    }
    
    func testAutolayoutSizeActivate() {
        view.fix(width: 150, height: 170)
        view.setNeedsLayout()
        view.layoutIfNeeded()

        view.deactivate(size: [.height])
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.width, 150)
        XCTAssertEqual(view.frame.height, 0)
    }
    
    func testScale() {
        view.fix(width: 20)
        view.scale(aspectRatio: 2.0)
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.bounds.height, 40)
    }
    
    func testGetConstants() {
        view.fix(width: 20, height: 30)
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.constants(in: [.width, .height]), [.width: 20, .height: 30])
    }
}
