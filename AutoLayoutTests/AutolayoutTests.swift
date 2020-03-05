//
//  AutolayouTests.swift
//  AutolayouTests
//
//  Created by Hassan Shahbazi on 25.12.2019.
//  Copyright © 2019 Hassan Shahbazi. All rights reserved.
//

import XCTest
@testable import AutoLayout

class AutolayoutTests: XCTestCase {
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

    func testAutolayoutSize() {
        view.fix(width: 150, height: 170)
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.width, 150)
        XCTAssertEqual(view.frame.height, 170)
    }
    
    func testAutolayoutOrigin() {
        view
            .fix(width: 200)
            .fix(trailing: (30, superView))
            .fix(top: (10, superView))
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()

        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 270)
    }
    
    func testAutolayoutOriginActivate() {
        view
            .fix(width: 200)
            .fix(top: (10, superView), isRelative: false)
            .fix(trailing: (30, superView), isRelative: false)
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        view
            .deactivate(constraints: [.trailing])
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 0)
        
        view
            .fix(leading: (30, superView), isRelative: false)
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

        view.deactivate(constraints: [.height])
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

    func testFindAttributes() {
        view
            .fix(top: (10, superView), bottom: (15, superView), isRelative: false)
            .fix(leading: (30, superView), trailing: (20, superView), isRelative: false)
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
    
        XCTAssertNotNil(view.find(attribute: .top))
        XCTAssertEqual(view.top!.constant, 10)
        
        XCTAssertNotNil(view.find(attribute: .bottom))
        XCTAssertEqual(view.bottom!.constant, -15)
        
        XCTAssertNotNil(view.find(attribute: .leading))
        XCTAssertEqual(view.leading!.constant, 30)
        
        XCTAssertNotNil(view.find(attribute: .trailing))
        XCTAssertEqual(view.trailing!.constant, -20)
    }

    func testGreaterAttributes() {
        view
            .fix(width: 200)
            .fix(leading: (30, superView), relation: .greaterThan)
            .fix(trailing: (30, superView))
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
    
        XCTAssertEqual(view.frame.origin.x, 270)
    }

    func testFindByID() {
        view
            .fix(trailing: (30, superView))
        superView.setNeedsLayout()
        superView.layoutIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        view.trailing?.identifier = "Test Trailing"
        XCTAssertNotNil(view.find(identifier: "Test Trailing"))
    }
}
