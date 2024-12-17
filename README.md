# InfinitePageControls
InfinitePageControls is a customizable and lightweight library for adding infinite scrolling page controls to iOS apps.

## Demo
![Demo](Infinite%20Page%20Controls/App/demo.gif)

## Support Me

If you find this project useful, please toss me a coffee:

<a href="https://buymeacoffee.com/kartiken" target="blank"><img src="https://www.codehim.com/wp-content/uploads/2022/09/bmc-button.png" width="200"><a/>


## Features
- Supports infinite scrolling
- Customizable using a configuration object
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
