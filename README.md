# About Canada
This is my first attempt at applying the **Model-View-ViewModel (MVVM)** architectural pattern for iOS development:

* The binding between the View and the ViewModel is done through the use of property observer `didSet` and closures.
* I create the View programmatically (no storyboard, xib except LaunchScreen.storyboard).

In this project, I also ...

* parse JSON data from a online resource  `facts.json`
* embed UITableView

## Application Overview

iOS application that displays "About Canada" (you will know why after running the application) based on their list of records.

## Code Structure Overview

While iOS MVVM architecture usually combines View and ViewController to be the View component of MVVM, I make a slight distinction
between the two of them:

* ViewController (Controller) acts as the data source and delegate to UITableView.
* ViewController (Controller) takes care of user interaction.

## Reflection

The application includes UITableView. Without storyboard, I need to set the height of the
UITableView programmatically through their respective **delegate methods**.


