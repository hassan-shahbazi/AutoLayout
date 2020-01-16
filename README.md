# AutoLayoutSwift
![Build Status](https://travis-ci.org/Hassaniiii/AutoLayout.svg?branch=master)
![cocoapods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)
![Licence](https://img.shields.io/github/license/Hassaniiii/CBORSwift.svg)

The library is aimed to help developers to apply complex AutoLayout structures in a few lines of code. The library is available under *MIT* license and is available over *Cocoapods* dependency manager.

## Installation

The library is published over *Cocoapods*. To install, just add the following line to your `podfile`:

```bash
pod AutoLayoutSwift ~> 2.0
```

And run the following command in *Terminal*

```bash
pod install
```

## Usage

### Primary constraints

The official documentation about AutoLayout concepts can be found at [Apple official documentation](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html) pages. However, the following descriptions enriched with screenshots might be helpful to understand the concept better. Before you deep into the following sections, please note that:

- The parameters in all functions are optional meaning you don't have to specify values for all anchors. The only specified anchors will be applied.
- The `isRelative` parameter determines if the anchor should be constrained by the corresponded anchor or not. For example, if you want to constraint the leading anchor of `viewA` to the trailing anchor of `viewB`, you may pass `true` for the parameter.
- The functions return `UIView` as the object, so it is possible to apply a chain of constraint to the target view. As an example:

```swift
viewA
  .fix(left: (0, viewB), isRelative: true)
  .fix(top: (0, superview), bottom: (0, superview), isRelative: false)
  .fix(height: 20)
```

#### leading, trailing

The *leading* and *trailing* anchors are referred also as *left* and *right* anchors respectively. To add constraints from `viewA` to `viewB`, you may use the following function. 

```swift
viewA.fix(left: (value, viewB), right: (value, viewB), isRelative: false
```
![Diagram](https://github.com/Hassaniiii/AutoLayout/blob/master/ScreenShots/leading-trailing.png)


#### Top - Bottom

To add *top* or *bottom* constraints from `viewA` to `viewB`, you may use the following function: 

```swift
viewA.fix(top: (value, viewB), bottom: (value, viewB), isRelative: false)
```
![Diagram](https://github.com/Hassaniiii/AutoLayout/blob/master/ScreenShots/top-bottom.png)


#### Width, Height, Aspect Ratio

To apply size constraints to `viewB` easily use the following function:

```swift
viewA.fix(width: 20, height: 30)
```

For applying an aspect ratio, you need to set a constraint for width OR height first, then by using the following function you can set an aspect ratio with respect to value you assigned to a size constraint first

```swift
viewA
  .fix(width: 20)
  .scale(aspectRatio: 2.0)
```
### Helper functions

The following 2 functions help to have more control over the constraints in a view

#### Deactivate

*Deactivate* feature simply remove/disable the constraint for the view. For example, the following line will remove any constraints that are assigned to *left* and *height* anchors

```swift
viewA.deactivate(origin: [.left], size: [.height])
```

#### Constants

To get the current values that are assigned to specified constraints, use the following function to get an dictionary indicating the value and the constraint. For example, the following code which will get the values assigned to the size constraints, the result would be: `[.width: value, .height: value]`

```swift
viewA.constants(in: [.width, .height])
```
