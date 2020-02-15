# Overview

This is a simple iOS application built using **Swift 5.1** and **Xcode 11.3** that displays a list of random cities with the ability to select a city from the list an show it's location on the map. The app is built using **MVP** with **Coordinator** pattern.  

# Demo
![Demo](Demo/demo.gif)

# Features
-  Displaying a list of cities with city name, country name and city location.
- Displaying a static location image for the city generated using [Maps Static API](https://developers.google.com/maps/documentation/maps-static/intro).
- Ability to paginate through the list with infinite scrolling feature.
- Sorting the list alphabetically by the city name then the country name.
- Ability to filter the list by entering a keyword in the search bar.
- Ability to show the city location on the map by tapping on an item from the list.
- Added optional `zoom(coordinate:)` function to change the map zoom level.
- Unit testing for the search function is provided.
- All features are merged to the `develop` branch using Pull Requests.  

# Branches
- `master` include the main project code base.
- `develop` includes the features from other branches merged using Pull Requests.
- `features/initializing_project` includes the starter project with initial configurations.
- `features/cities_list` includes the main screen which has the cities list with associated information for each city.
- `features/search_filter` includes the search filter functionality using [UISearchController](https://developer.apple.com/documentation/uikit/uisearchcontroller).
- `features/map_location` includes showing the city location on the map by adding annotation.
- `features/enhancements` includes some enhancements for the UI and the code base.
- `features/filter_unit_test` includes unit testing for the search filter algorithm.

# Third party libraries used
- [Moya](https://github.com/Moya/Moya)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
- [UIScrollView-InfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll)
- [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView)
