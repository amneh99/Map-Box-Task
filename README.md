# Map Box Task
 
This iOS application allows users to explore the indoor layout of **O'Hare International Airport (ORD)** — discover hidden spots — and drop your own marker!

## How It's Made:

Tech Stack:

Swift 5

SwiftUI

Mapbox Maps SDK for iOS

## Key Features:

Map display using Mapbox Maps SDK for iOS  

Centered on an indoor location (ORD airport)

Tap on the map to place a marker

Tap again to move the marker

"Reset" button to remove the marker

## Adiitional Features:

Show latitude and longitude of current marker

Use a custom marker icon

Button to toggle between **Dark** and **Light** map styles  

Reset Zoom: Returns the map to the original camera position and zoom level centered on ORD airport

## 🔧 How to Run

1. Clone the repo
2. Open the `.xcodeproj` in Xcode
3. Install dependencies via Swift Package Manager:  
   - Use the URL: `https://github.com/mapbox/mapbox-maps-ios.git` 
4. Ensure your Mapbox access token is set in the `Info.plist` (mine is already included)
5. Build and run the app on a simulator or device
