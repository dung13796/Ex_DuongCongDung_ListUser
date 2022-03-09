# Ex_DuongCongDung_ListUser

## Demo

![](https://github.com/dung13796/Ex_DuongCongDung_ListUser/blob/master/ListGithubUser/Assets/demo.gif)

## Version

1.0.0

## Platform
iOS

## Language Programming
Swift

## Build and Runtime Requirements
+ Xcode 13.0 or later
+ iOS 15.0 or later
+ OS BigSur 11.4 or later

## Design Pattern

Main design pattern of project is MVVM.

## Project Structure

| Name                  | Description                                                  |
| :-------------------- | ------------------------------------------------------------ |
| Define/               | The most time static values will be put here, such as third party keys, colors, fonts... |
| Define/Constant.swift | Strings, colors, font will be defined here                   |
| View/                 | Everything relative directly to UI                           |
| View/Base/            | Base classes for view controller, popup controller...        |
| Model/API/            | API request will be handled here                             |
| Model/Schema/         | Objects Model will be defined here                           |
| Library/              | Helper, Utils, Extension... or frameworks which cannot be put in CocoaPods (ex: modified, no podspec found...) |
| Supports/             | Application info, target configuration, bridging...          |

## List of Frameworks

| Framework          | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| Alamofire          | Elegant HTTP Networking in Swift.                            |
| OHHTTPStubs/Swift  | a library designed to stub your network requests very easily. |

## Useful Tools and Resources

1. CocoaPods - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
2. Encoding and Decoding Custom Types - Make your data types encodable and decodable for compatibility with external representations such as JSON.
