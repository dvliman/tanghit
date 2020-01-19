## Splash Screen

Implement splash screen per this tutorial: https://medium.com/flutter-community/flutter-2019-real-splash-screens-tutorial-16078660c7a1
* doesn't seem to work for ios device (simulator) yet

* Android
    * android/app/src/main/res/drawable/launch_background.yml (calls @colors/splash_color)
    * android/app/src/main/res/values/styles.xml (<color name="splash_color" ...)
    * android/app/src/main/res/values/mipmap-hdpi
    * android/app/src/main/res/values/mipmap-mdpi
    * android/app/src/main/res/values/mipmap-xhdpi
    * android/app/src/main/res/values/mipmap-xxhdpi
    * android/app/src/main/res/values/mipmap-xxxhdpi
* Ios
    * Runner/Assets.xcassets/*
    * Change the settings for LaunchScreen.storyboard (LaunchImage)
