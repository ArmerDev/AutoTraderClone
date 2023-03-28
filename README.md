# AutoTraderClone

## About
Built using SwiftUI, this application is a replica of the popular AutoTrader application. 

I decided to build this project as a way to apply the knowledge that I have learnt while completing Paul Hudson's 100 Days of SwiftUI course.

### Home Screen
![AutoTraderCloneHome_AdobeExpress](https://user-images.githubusercontent.com/116413320/228197733-c88be345-85b1-4fe1-8759-9266bafe800e.gif)

The home screen consists of a horizontal scrollview displaying vehicle types at the top of the screen (only cars were used in this project) and a search area below which is displayed within a ScrollView. As the user searches and views vehicles, those recent searches and viewed vehicles will be displayed below the search area (this can be seen lower down in this Readme file).

## Search
![ATCSearch_2_AdobeExpress](https://user-images.githubusercontent.com/116413320/228256297-14c2d8d4-69fa-460c-9a15-ab5659db7adf.gif)

![Screen_Recording_2023-03-28_at_14_24_24_AdobeExpress](https://user-images.githubusercontent.com/116413320/228257567-c9b81b85-e59e-49eb-be03-075ef7542d3d.gif)

## Sorting Results
![Screen_Recording_2023-03-28_at_14_58_07_AdobeExpress](https://user-images.githubusercontent.com/116413320/228262802-ab45c165-6192-4ec5-8759-2cc0b9accc22.gif)

An array containing the sorting options was assigned to a constant called sortOptions, which is used within a ForEach loop to have each option displayed within the Picker view. The picker is displayed within a Menu view.

```Swift
let sortOptions = ["Price (Lowest)", "Price (Highest)", "Distance", "Mileage", "Age (Newest first)", "Age (Oldest first)", "Most recent"]
```

```Swift
Menu {
  Picker("Sort Options", selection: $sortedBy) {
    ForEach(sortOptions, id: \.self) {
      Text($0)
      }
  }
} label: {
    Text("\(Image(systemName: "arrow.up.arrow.down")) Sort by")
}
```

The selection made in the Picker is stored in a state variable called sortedBy, which causes the views to reload when changed.
The below switch statement is used in the sort method on the array of vehicles to display the vehicles in the desired sorting order

```Swift
switch sortedBy {
  case "Price (Lowest)": return $0.price < $1.price
  case "Price (Highest)": return $0.price > $1.price
  case "Distance": return $0.distance < $1.distance
  case "Mileage": return $0.mileage < $1.mileage
  case "Age (Newest first)": return $0.year > $1.year
  case "Age (Oldest first)": return $0.year < $1.year
  case "Most recent": return $0.dateAdded > $1.dateAdded
  default: return $0.imageName < $1.imageName
}
```


## Recently Searched & Recently Viewed
![Screen_Recording_2023-03-28_at_14_23_49_AdobeExpress](https://user-images.githubusercontent.com/116413320/228259587-c8ffe86f-a773-424e-b372-13b6160898fc.gif)


## List View
![AutoTraderCloneListView_AdobeExpress](https://user-images.githubusercontent.com/116413320/228200677-0bcc5457-17c5-4730-8906-b151a60b72d2.gif)


## Image Gallary
![AutoTraderCloneSmallGallary_AdobeExpress](https://user-images.githubusercontent.com/116413320/228202163-00cbeff3-d901-4652-84a3-7cdec48aae78.gif)

## Fullscreen Image Gallary
![Screen_Recording_2023-03-28_at_12_35_40_AdobeExpress](https://user-images.githubusercontent.com/116413320/228235623-d7b204c7-a69d-4fd8-b439-d00f7fffc17e.gif)
