//
//  UIView+Extensions.swift
//  Autolayou
//
//  Created by Hassan Shahbazi on 25.12.2019.
//  Copyright © 2019 Hassan Shahbazi. All rights reserved.
//

import UIKit

public enum Relation {
    case equal
    case greaterThan
    case lessThan
    
    func apply(for target: UIView, top: (value: CGFloat, toView: UIView), toSafeArea: Bool, isRelative: Bool) {
        let (value, toView) = top
        let constraint: NSLayoutConstraint
        
        switch self {
        case .equal:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.topAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.bottomAnchor : toView.safeAreaLayoutGuide.topAnchor, constant: value)
            } else {
                constraint = target.topAnchor.constraint(equalTo: isRelative ? toView.bottomAnchor : toView.topAnchor, constant: value)
            }
        case .greaterThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.topAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.bottomAnchor : toView.safeAreaLayoutGuide.topAnchor, constant: value)
            } else {
                constraint = target.topAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.bottomAnchor : toView.topAnchor, constant: value)
            }
        case .lessThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.topAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.bottomAnchor : toView.safeAreaLayoutGuide.topAnchor, constant: value)
            } else {
                constraint = target.topAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.bottomAnchor : toView.topAnchor, constant: value)
            }
        }
    
        constraint.priority = .defaultHigh
        constraint.isActive = true
    }
    
    func apply(for target: UIView, bottom: (value: CGFloat, toView: UIView), toSafeArea: Bool, isRelative: Bool) {
        let (value, toView) = bottom
        let constraint: NSLayoutConstraint
        
        switch self {
        case .equal:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.bottomAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.topAnchor : toView.safeAreaLayoutGuide.bottomAnchor, constant: -value)
            } else {
                constraint = target.bottomAnchor.constraint(equalTo: isRelative ? toView.topAnchor : toView.bottomAnchor, constant: -value)
            }
        case .greaterThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.bottomAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.topAnchor : toView.safeAreaLayoutGuide.bottomAnchor, constant: -value)
            } else {
                constraint = target.bottomAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.topAnchor : toView.bottomAnchor, constant: -value)
            }
        case .lessThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.bottomAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.topAnchor : toView.safeAreaLayoutGuide.bottomAnchor, constant: -value)
            } else {
                constraint = target.bottomAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.topAnchor : toView.bottomAnchor, constant: -value)
            }
        }
    
        constraint.priority = .defaultHigh
        constraint.isActive = true
    }
    
    func apply(for target: UIView, leading: (value: CGFloat, toView: UIView), toSafeArea: Bool, isRelative: Bool) {
        let (value, toView) = leading
        let constraint: NSLayoutConstraint
        
        switch self {
        case .equal:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.leadingAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.trailingAnchor : toView.safeAreaLayoutGuide.leadingAnchor, constant: value)
            } else {
                constraint = target.leadingAnchor.constraint(equalTo: isRelative ? toView.trailingAnchor : toView.leadingAnchor, constant: value)
            }
        case .greaterThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.leadingAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.trailingAnchor : toView.safeAreaLayoutGuide.leadingAnchor, constant: value)
            } else {
                constraint = target.leadingAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.trailingAnchor : toView.leadingAnchor, constant: value)
            }
        case .lessThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.leadingAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.trailingAnchor : toView.safeAreaLayoutGuide.leadingAnchor, constant: value)
            } else {
                constraint = target.leadingAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.trailingAnchor : toView.leadingAnchor, constant: value)
            }
        }
    
        constraint.priority = .defaultHigh
        constraint.isActive = true
    }
    
    func apply(for target: UIView, trailing: (value: CGFloat, toView: UIView), toSafeArea: Bool, isRelative: Bool) {
        let (value, toView) = trailing
        let constraint: NSLayoutConstraint
        
        switch self {
        case .equal:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.trailingAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.leadingAnchor : toView.safeAreaLayoutGuide.trailingAnchor, constant: -value)
            } else {
                constraint = target.trailingAnchor.constraint(equalTo: isRelative ? toView.leadingAnchor : toView.trailingAnchor, constant: -value)
            }
        case .greaterThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.trailingAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.leadingAnchor : toView.safeAreaLayoutGuide.trailingAnchor, constant: -value)
            } else {
                constraint = target.trailingAnchor.constraint(greaterThanOrEqualTo: isRelative ? toView.leadingAnchor : toView.trailingAnchor, constant: -value)
            }
        case .lessThan:
            if #available(iOS 11, *), toSafeArea {
                constraint = target.trailingAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.safeAreaLayoutGuide.leadingAnchor : toView.safeAreaLayoutGuide.trailingAnchor, constant: -value)
            } else {
                constraint = target.trailingAnchor.constraint(lessThanOrEqualTo: isRelative ? toView.leadingAnchor : toView.trailingAnchor, constant: -value)
            }
        }
    
        constraint.priority = .defaultHigh
        constraint.isActive = true
    }
}

extension UIView {
    @discardableResult
    public func fix(width: CGFloat = -1, height: CGFloat = -1) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        
        if width >= 0 {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }
        if height >= 0 {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }
        
        constraints.forEach {
            $0.priority = .defaultHigh
            $0.isActive = true
        }
        return self
    }
    
    @discardableResult
    public func fix(leading: (value: CGFloat, toView: UIView)? = nil, trailing: (value: CGFloat, toView: UIView)? = nil, toSafeArea: Bool = false, isRelative: Bool = false, relation: Relation = .equal) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let _ = leading {
            relation.apply(for: self, leading: leading!, toSafeArea: toSafeArea, isRelative: isRelative)
        }
        if let _ = trailing {
            relation.apply(for: self, trailing: trailing!, toSafeArea: toSafeArea, isRelative: isRelative)
        }
        return self
    }
    
    @discardableResult
    public func fix(top: (value: CGFloat, toView: UIView)? = nil, bottom: (value: CGFloat, toView: UIView)? = nil, toSafeArea: Bool = false, isRelative: Bool = false, relation: Relation = .equal) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let _ = top {
            relation.apply(for: self, top: top!, toSafeArea: toSafeArea, isRelative: isRelative)
        }
        if let _ = bottom {
            relation.apply(for: self, bottom: bottom!, toSafeArea: toSafeArea, isRelative: isRelative)
        }
        return self
    }
    
    @discardableResult
    public func center(toX: UIView? = nil, toY: UIView? = nil) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let view = toX {
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        }
        if let view = toY {
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func scale(aspectRatio: CGFloat = 1.0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: aspectRatio)
        constraint.priority = .defaultHigh
        constraint.isActive = true
        
        return self
    }

    private func fix() -> Self { self }
}

extension UIView {
    public func constants(in layouts: [NSLayoutConstraint.Attribute]) -> [NSLayoutConstraint.Attribute: CGFloat] {
        self.constraints
            .filter { layouts.contains($0.firstAttribute) }
            .reduce(into: [:]) { (list: inout [NSLayoutConstraint.Attribute: CGFloat], constraint: NSLayoutConstraint) in
                list[constraint.firstAttribute] = constraint.constant
            }
    }
    
    @discardableResult
    public func deactivate(constraints: [NSLayoutConstraint.Attribute]) -> Self {
        constraints.forEach({
            self.find(attribute: $0)?.isActive = false
        })
        
        return self
    }
    
    public func find(attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let direct = self.find(attribute: attribute, reverse: false) {
            return direct
        }
        return self.find(attribute: attribute, reverse: true)
    }
    
    public func find(identifier: String) -> NSLayoutConstraint? {
        if let origin = self.superview?.constraints.first(where: {
             $0.identifier == identifier
        }) {
            return origin
        }
        return self.constraints.first {
            $0.identifier == identifier
        }
    }
    
    private func find(attribute: NSLayoutConstraint.Attribute, reverse: Bool) -> NSLayoutConstraint? {
        if let origin = self.superview?.constraints.first(where: {
            if reverse {
                return $0.secondItem as? UIView == self && $0.secondAttribute == attribute
            }
            return $0.firstItem as? UIView == self && $0.firstAttribute == attribute
        }) {
            return origin
        }
        return self.constraints.first(where: {
            $0.firstItem as? UIView == self && $0.firstAttribute == attribute
        })
    }
}

extension UIView {
    public var top: NSLayoutConstraint? {
        self.find(attribute: .top)
    }
    
    public var bottom: NSLayoutConstraint? {
        self.find(attribute: .bottom)
    }
    
    public var leading: NSLayoutConstraint? {
        self.find(attribute: .leading)
    }
    
    public var trailing: NSLayoutConstraint? {
        self.find(attribute: .trailing)
    }
    
    public var width: NSLayoutConstraint? {
        self.find(attribute: .width)
    }
    
    public var height: NSLayoutConstraint? {
        self.find(attribute: .height)
    }
}