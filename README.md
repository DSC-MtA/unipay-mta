# UniPay MtA

UniPay MtA is a transaction management system designed for the University Club at Mount Allison University.
The application is being developed by MtA's [Developer Student Club](https://dsc.mtahacks.ca/). 

## Getting Started

To start working with flutter on the web, first, we need to install Flutter
[using these instructions](https://flutter.dev/docs/get-started/install). Because we're building for
web, we'll also need to turn on some extra features. After ensuring the flutter installation is correct using
`flutter doctor -v`, we can perform the following:

```
flutter channel beta
flutter upgrade
flutter config --enable-web
```

This turns on beta features for web development, which we need for deployment. Note that this requires Google Chrome to
test. We can verify that this is set up by running `flutter devices`: it should display Chrome as one of the devices to
send to.

```
Chrome     • chrome     • web-javascript • Google Chrome 79.0.3945.79
Web Server • web-server • web-javascript • Flutter Tools
```

If we use `cd` to get into the folder with our flutter application, we can run the following to install dependencies and
run the application:
 
```
flutter packages get
flutter run -d chrome
```

After a minute or so, the application will show in the Chrome browser window. To quit, go back to the terminal and press
`CONTROL-C`.

## Building the Project

To build the app for web, just `cd` to the directory and then do `flutter build web`.
To then deploy it, do the following:

```
npm install -g firebase-tools
firebase login
firebase init
firebase deploy --only hosting
```

For more information, visit [this link](https://itnext.io/flutter-web-firebase-hosting-45d7e3fc50f9).

## Online Tutorials

- [Flutter in Focus YouTube series](https://www.youtube.com/playlist?list=PLjxrf2q8roU2HdJQDjJzOeO6J3FoFLWr2)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

## Useful Documentation

- [Main Flutter Documentation](https://flutter.dev/docs)

### Visual

- [Widget Library](https://flutter.dev/docs/development/ui/widgets/material)

### State Management

- [Redux state management API](https://pub.dev/documentation/redux/latest/)
- [Flutter-Redux state management API](https://pub.dev/documentation/flutter_redux/latest/)
