// Magic 8 Ball — iPhone + Apple Watch

A delightful, modern SwiftUI take on the classic Magic 8 Ball. Ask a question, shake your device, and get a whimsical, animated answer. Includes a beautifully integrated Apple Watch companion for quick, on-the-go fortune checks.

- Platforms: iOS + watchOS
- Tech: SwiftUI, Swift Concurrency, Haptics, Watch Connectivity
- Status: Production-ready sample app

## Contents
- Overview
- Features
- Screenshots
- How It Works
- Architecture & Tech
- Requirements
- Installation
- Privacy & Data
- Testing
- Roadmap
- Contributing
- License

## Overview
Magic 8 Ball brings a playful experience to your Apple devices with smooth animations, subtle haptics, and a clean interface. The app embraces platform conventions so it feels right at home on iPhone and Apple Watch.

- Ask anything. Shake or tap to get an answer.
- Crisp animations and delightful haptics amplify the moment.
- Apple Watch app for ultra-fast, glanceable results.

## Features
- Fast, fluid interactions (shake or tap)
- Curated set of classic 8-ball responses
- Optional haptics feedback for realism
- Lightweight, responsive SwiftUI UI
- Apple Watch companion for quick checks
- Accessibility-friendly (Dynamic Type, VoiceOver labels where applicable)

## Screenshots
- iPhone — Home

![iPhone Screenshot 1](Screenshots/iphone-1.png "iPhone — Main Screen")

- iPhone — Answer

![iPhone Screenshot 2](Screenshots/iphone-2.png "iPhone — Answer State")

- Apple Watch — Home

![Apple Watch Screenshot 1](Screenshots/watch-1.png "Apple Watch — Main")

- Apple Watch — Answer

![Apple Watch Screenshot 2](Screenshots/watch-2.png "Apple Watch — Answer State")

## How It Works
1. User asks a question (silently or aloud — we don’t record anything).
2. A shake gesture or a tap triggers the answer generation.
3. The app picks a response from a curated list and animates it into view.
4. Subtle haptics add tactile feedback.

## Architecture & Tech
- SwiftUI for UI on iOS and watchOS
- State-driven design 
- Swift Concurrency for any async tasks or delays
- Haptics for tactile feedback on shake/tap
- Watch app implemented as a companion target

## Requirements
- Xcode 15 or later
- iOS 18.5 or later
- watchOS 11 or later

## Installation
- Clone the repository
- Open the `.xcodeproj` or `.xcworkspace` in Xcode
- Select the iOS scheme and run on a simulator or device
- For Apple Watch, select the watch scheme or run the watch app via the paired simulator/device

## Privacy & Data
- No personal data collection
- No network calls required for answers
- All logic runs on-device

## Testing
- UI previews via SwiftUI `#Preview` macros
- To add tests: create a new test target and add cases for the response list and triggering logic

## Roadmap
- Localized responses
- Configurable response sets
- Optional sound effects
- Live Activity or widget support

## Contributing
Contributions are welcome! Please:
- Open an issue describing your proposal or bug
- Keep pull requests focused and small
- Follow Swift API design guidelines and platform conventions

## License
This project is available under the MIT License. See `LICENSE` for details.

---

### Notes for Maintainers
- Keep screenshots up to date for both iPhone and Apple Watch
- Validate accessibility with VoiceOver and larger text sizes
- Verify haptics behavior on physical devices
