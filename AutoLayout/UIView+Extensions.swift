//
//  UIView+Extensions.swift
//  Autolayou
//
//  Created by Hassan Shahbazi on 25.12.2019.
//  Copyright © 2019 Hassan Shahbazi. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    public func fix(width: CGFloat = -1, height: CGFloat = -1) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if width >= 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height >= 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    public func fix(leading: (value: CGFloat, toView: UIView)? = nil, trailing: (value: CGFloat, toView: UIView)? = nil, toSafeArea: Bool = false, isRelative: Bool = false) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let (value, toView) = leading {
            if #available(iOS 11, *), toSafeArea {
                self.leadingAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.trailingAnchor : toView.safeAreaLayoutGuide.leadingAnchor, constant: value).isActive = true
            } else {
                self.leadingAnchor.constraint(equalTo: isRelative ? toView.trailingAnchor : toView.leadingAnchor, constant: value).isActive = true
            }
        }
        if let (value, toView) = trailing {
            if #available(iOS 11, *) {
                self.trailingAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.leadingAnchor : toView.safeAreaLayoutGuide.trailingAnchor, constant: -value).isActive = true
            } else {
                self.trailingAnchor.constraint(equalTo: isRelative ? toView.leadingAnchor : toView.trailingAnchor, constant: -value).isActive = true
            }
        }
        return self
    }
    
    @discardableResult
    public func fix(top: (value: CGFloat, toView: UIView)? = nil, bottom: (value: CGFloat, toView: UIView)? = nil, toSafeArea: Bool = false, isRelative: Bool = false) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let (value, toView) = top {
            if #available(iOS 11, *), toSafeArea {
                self.topAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.bottomAnchor : toView.safeAreaLayoutGuide.topAnchor, constant: value).isActive = true
            } else {
                self.topAnchor.constraint(equalTo: isRelative ? toView.bottomAnchor : toView.topAnchor, constant: value).isActive = true
            }
        }
        if let (value, toView) = bottom {
            if #available(iOS 11, *) {
                self.bottomAnchor.constraint(equalTo: isRelative ? toView.safeAreaLayoutGuide.topAnchor : toView.safeAreaLayoutGuide.bottomAnchor, constant: -value).isActive = true
            } else {
                self.bottomAnchor.constraint(equalTo: isRelative ? toView.topAnchor : toView.bottomAnchor, constant: -value).isActive = true
            }
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
    public func constants(in layouts: [NSLayoutConstraint.Attribute]) -> [NSLayoutConstraint.Attribute: CGFloat] {
        self.constraints
            .filter { layouts.contains($0.firstAttribute) }
            .reduce(into: [:]) { (list: inout [NSLayoutConstraint.Attribute: CGFloat], constraint: NSLayoutConstraint) in
                list[constraint.firstAttribute] = constraint.constant
            }
    }
    
    @discardableResult
    public func scale(aspectRatio: CGFloat = 1.0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: aspectRatio).isActive = true
        
        return self
    }
}

extension UIView {
    @discardableResult
    public func deactivate(constraints: [NSLayoutConstraint.Attribute]) -> Self {
        constraints.forEach({
            self.find(attribute: $0)?.isActive = false
        })
        
        return self
    }
    
    public func find(attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let origin = self.superview?.constraints
            .filter({ target in
                target.firstItem as? UIView == self && target.firstAttribute == attribute
            }).first {
                return origin
            }
        return self.constraints
            .filter({ target in
                target.firstItem as? UIView == self && target.firstAttribute == attribute
            }).first
    }
}
