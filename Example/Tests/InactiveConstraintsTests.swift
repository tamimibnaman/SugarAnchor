//
//  InactiveConstraintsTests.swift
//  SugarAnchor
//
//  Created by Ashik uddin Ahmad on 5/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import SugarAnchor

class InactiveConstraintsTests: XCTestCase {
    var containerView: UIView!
    var view1: UIView!
    var view2: UIView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        containerView = UIView()
        view1 = UIView()
        view2 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(view1)
        containerView.addSubview(view2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        containerView = nil
        view1 = nil
        view2 = nil
        super.tearDown()
    }
    
    func testInactiveEqualBasic() {
        let constraint = view1.leadingAnchor =~= view2.leadingAnchor
        XCTAssert(constraint.firstItem === view1)
        XCTAssert(constraint.secondItem === view2)
        XCTAssert(constraint.firstAttribute == .leading)
        XCTAssert(constraint.secondAttribute == .leading)
        XCTAssert(constraint.relation == .equal)
        XCTAssert(constraint.isActive == false)
    }
    
    func testInactiveEqualWithConstant() {
        let constraint = view1.leadingAnchor =~= view2.leadingAnchor + 20
        XCTAssert(constraint.firstItem === view1)
        XCTAssert(constraint.secondItem === view2)
        XCTAssert(constraint.firstAttribute == .leading)
        XCTAssert(constraint.secondAttribute == .leading)
        XCTAssert(constraint.relation == .equal)
        XCTAssert(constraint.constant == 20)
        XCTAssert(constraint.isActive == false)
    }
    
    func testInactiveEqualWithNegativeConstant() {
        let constraint = view1.leadingAnchor =~= view2.leadingAnchor - 20
        XCTAssert(constraint.firstItem === view1)
        XCTAssert(constraint.secondItem === view2)
        XCTAssert(constraint.firstAttribute == .leading)
        XCTAssert(constraint.secondAttribute == .leading)
        XCTAssert(constraint.relation == .equal)
        XCTAssert(constraint.constant == -20)
        XCTAssert(constraint.isActive == false)
    }
    
    func testInactiveEqualConstantOnly() {
        let constraint = view1.widthAnchor =~= 200
        XCTAssert(constraint.firstItem === view1)
        XCTAssert(constraint.firstAttribute == .width)
        XCTAssert(constraint.relation == .equal)
        XCTAssert(constraint.constant == 200)
        XCTAssert(constraint.isActive == false)
    }
    
    func testInactiveEqualWithMultiplier() {
        let constraint = view1.widthAnchor =~= view2.widthAnchor * 2
        XCTAssert(constraint.firstItem === view1)
        XCTAssert(constraint.secondItem === view2)
        XCTAssert(constraint.firstAttribute == .width)
        XCTAssert(constraint.secondAttribute == .width)
        XCTAssert(constraint.relation == .equal)
        XCTAssert(constraint.multiplier == 2)
        XCTAssert(constraint.isActive == false)
    }
    
}
