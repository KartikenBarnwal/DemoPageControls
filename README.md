# InfinitePageControls
Customised Page Controls for Swift Developers

# InfinitePageControls

A customizable infinite page control view for iOS, written in Swift.

## Features
- Supports infinite scrolling
- Highly customizable using a configuration object
- Smooth animations for transitions

## Installation

Use Swift Package Manager to add `InfinitePageControls` to your project:

1. Go to **File > Add Packages** in Xcode.
2. Enter the repository URL: `https://github.com/yourusername/InfinitePageControls`.

## Usage

```swift
import InfinitePageControls

let config = InfinitePageControlsConfig(
    circleSize: 40,
    spacing: 15,
    totalCircles: 8,
    visibleCircles: 3,
    smallCircleRatio: 0.6
)

let pageControl = InfinitePageControlsView(frame: CGRect(x: 20, y: 100, width: 300, height: 60), config: config)
view.addSubview(pageControl)

// Navigate circles
pageControl.nextCircle()
pageControl.prevCircle()

```