# SampleSiri

The SampleSiri project was implemented to show how an iOS app could provide Siri integration to access features provided by the app. Using Intent and Intent UI extensions, your app can provide the necessary code to allow Siri to recognize a phrase that will speak a response for the feature.

Users can find the 'Add to Siri' button in your app's view, and tap to add with their own personal phrase. Or they can go to Settings to find all shortcuts available for your app, or other apps installed on their devices.

The following sections outline the groups contained in the SampleSiri Xcode project. The project uses cocoapods to provide integration with Alamofire, which is used to access any endpoints your app requires. We also included cocoapods for Quick and Nimble, which are unit testing frameworks that provide a simple methodology for Test Driven Development. The versions of these dependencies can be found and updated in the Podfile. To install the dependencies, you can use the 'pod install' command from the directory where the Podfile is located.

# SampleSiri group provides the App's UI

The SampleSiri Group contains a Utils group and a View Controller group, as well as supporting files for the app: entitlements, a main storyboard, an AppDelegate and SceneDelegate which are used for application and window management, an Assets file that contains images for the app, a LaunchScreen storyboard for your splash screen, and an Info.plist file, which contains configuration information for the app.

Utils Group - AlertUtils is a wrapper for displaying an alert. MockAlertUtils & MockError are simple mocked out versions of AlertUtils & MockErrors. They are used in the ViewControllerTests unit test file.

ViewController Group - ViewController is responsible for the behaviour of our display. It binds the actions to the UI elements. MockViewController is a mock version of the ViewController that counts the number of calls to present/dismiss. ViewControllerTests contains units tests.

# SampleSiriTests

The SampleSiriTests Target is where you CAN put tests for the SampleSiri group. In this project, we decided to have the currently existing test (ViewControllerTests.swift) to exist in the same group as the ViewController.

# SampleSiriUITests

The SampleSiriUITests Target is where you would write functional tests for the Siri UI. In this app, the UI wasn't complicated enough for us to write any tests.

# SampleIntent

The SampleIntent Target is responsible for handling Siri's response to user input.

WhatsTheTimeIntents.intentdefinition - Define your Intent and corresponding Intent Response. In this file, you can modify different configuration settings for your Intent like Title, Images, Parameters, etc. In this example, the Intent we've created has to do with asking Siri what time it is.

IntentHandler.swift - Determines how to handle the Intent depending on what type of Intent is coming in. Since our app is currently only handling 1 type of Intent (WhatsTheTimeIntent), the handler currently only returns WhatsTheTimeIntentHandler().

Info.plist - You must add your Intent to this .plist configuration file under NSExtension > NSExtensionAttributes > IntentsSupported

WhatsTheTimeIntentHandler.swift - This file has the logic that will be executed in response to the WhatsTheTime Intent. You can see that when the WhatsTheTime Intent is handled, it returns a success code and the current time.

# SampleIntentUI

The SampleIntentUI Target is responsible for handling the visual part of Siri's response to user input.

IntentViewController.swift - We only have 1 ViewController that we have to display each specific intent. In order to display a new Intent, you have to add a child ViewController to the IntentViewController.

MainInterface.storyboard - The presentation of the ViewController that is going to show in Siri.

WhatsTheTimeViewController.swift - Controls what displays in the UI display after Siri is invoked.

# SampleTime

The SampleTime Framework is a separate target that can be accessed by the application code as well as the SampleIntent and SampleIntentUI extensions.

SampleTime.swift - A class that can retrieve the current datetime in any format (military vs. standard, etc.).

## Helpful Links

# --------------

iOS 13 Custom Intent with Siri Dialog
https://medium.com/better-programming/ios-13-custom-intent-with-siri-dialog-909d5d78e9ed
