# Tabbar_SwiftUI
Creating a simple `TabBar` application in Swift is straightforward with SwiftUI. Below is a step-by-step guide on how to build a basic `TabBar` app with three tabs.

### Steps:

1. Create a new Xcode project.
   - Select **App** and click **Next**.
   - Name your project (e.g., `TabBarExample`), choose **Swift** as the language, and make sure **SwiftUI** is selected as the interface.
   - Click **Next** and create the project.

2. Update the content in `ContentView.swift` to include the `TabView`.

### Code:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home")
                .font(.largeTitle)
                .padding()
        }
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search")
                .font(.largeTitle)
                .padding()
        }
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

### Explanation:
1. **TabView**: This is the main container for your tabs. It allows you to switch between different views using the tab bar at the bottom.
2. **TabItem**: Each `tabItem` defines the content of the tab, including an image and a text label.
3. **HomeView, SearchView, and SettingsView**: These are simple views representing the content of each tab.

### Running the App:
- Run the app, and you will see a tab bar at the bottom with three tabs: Home, Search, and Settings.
