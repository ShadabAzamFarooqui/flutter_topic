import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

import '../component/highlight_view.dart';

class FirebasePushNotificationExample extends StatelessWidget {
  const FirebasePushNotificationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Firebase Push Notification Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Android:'),
          NormalView(
              text:
                  'In the Firebase console, click on the Android icon to add an Android app.'),
          NormalView(
              text:
                  'Register your app with the package name (e.g., com.example.yourapp).'),
          NormalView(
              text:
                  'Download the google-services.json file and place it in the android/app directory of your Flutter project.'),
          NormalView(
              text:
                  'Open android/build.gradle and add the following classpath to the dependencies section:'),
          HighlightView(text: 'android/build.gradle'),
          CodeView(code: '''
          
buildscript {
    dependencies {
        // Add this line
        classpath 'com.google.gms:google-services:4.3.15'  // Check for the latest version
    }
} 
          '''),
          HighlightView(text: 'android/app/build.gradle'),
          CodeView(code: '''
apply plugin: 'com.android.application'
apply plugin: 'com.google.gms.google-services'  // Add this line

dependencies {
    // Add these dependencies
    implementation 'com.google.firebase:firebase-messaging:24.0.0'  // Check for the latest version
}                                                      
          '''),
          NormalView(
              text:
                  'Add the Firebase and messaging dependencies to the dependencies section:'),
          CodeView(code: '''
implementation 'com.google.firebase:firebase-messaging:24.2.0'                                                    
          '''),
          HighlightView(text: 'android/app/src/main/AndroidManifest.xml'),
          CodeView(code: '''
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE"/>

<application
    android:label="flutter_app"
    android:icon="@mipmap/ic_launcher">
    <!-- Add these lines -->
    <service
        android:name="com.google.firebase.messaging.FirebaseMessagingService"
        android:exported="true"/>
    <service
        android:name="com.google.firebase.messaging.FirebaseMessagingService"
        android:exported="true"
        android:permission="com.google.android.c2dm.permission.SEND">
        <intent-filter>
            <action android:name="com.google.firebase.MESSAGING_EVENT"/>
        </intent-filter>
    </service>
</application>

          '''),

          HeadingView(text: 'iOS'),
          HighlightView(text: '1. Set Up Firebase Project'),
          NormalView(text: 'Add an iOS app to your Firebase project:'),
          NormalView(text: 'Click on the iOS icon to add a new app.'),
          NormalView(text: 'Enter your iOS bundle ID (found in Xcode under your project settings).'),
          NormalView(text: 'Download the GoogleService-Info.plist file.'),
          HighlightView(text: '2. Add Firebase SDK to Your iOS Project'),
          NormalView(text: 'Navigate to the ios directory of your Flutter project and open the .xcworkspace file in Xcode.'),
          NormalView(text: 'Drag and drop the GoogleService-Info.plist file into your Xcode project navigator. Make sure "Copy items if needed" is checked.'),
          NormalView(text: 'Open ios/Podfile and modify it as follows:'),
          CodeView(code: '''
platform :ios, '10.0'                                                                                                     

target 'Runner' do
  use_frameworks!
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'
end

          '''),
          NormalView(text: 'Run pod install in the ios directory to install the new dependencies.'),
          HighlightView(text: '3. Configure Push Notifications in Xcode'),
          NormalView(text: 'Go to your project settings in Xcode and select the target for your app, then go to the "Signing & Capabilities" tab.'),
          NormalView(text: 'Click the "+" button and add the "Push Notifications" capability.'),
          NormalView(text: 'In the same "Signing & Capabilities" tab, add "Background Modes".'),
          NormalView(text: 'Check "Remote notifications" to enable background notifications.'),
          HighlightView(text: '4. Configure AppDelegate.swift'),
          CodeView(code: '''
import UIKit
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    Messaging.messaging().delegate = self
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [String: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    Messaging.messaging().appDidReceiveMessage(userInfo)
    completionHandler(.newData)
  }

  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [String: Any]) {
    Messaging.messaging().appDidReceiveMessage(userInfo)
  }
}

extension AppDelegate: MessagingDelegate {
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("FCM registration token: \(fcmToken ?? "")")
    // Optionally send the token to your server
  }
}
'''),
          HighlightView(text: '''
5. Request User Permission for Notifications
'''),
          NormalView(text: 'Open Info.plist (found in the ios/Runner directory) and add the following keys to request notification permissions:'),
          CodeView(code: '''
<key>UIBackgroundModes</key>
<array>
  <string>fetch</string>
  <string>remote-notification</string>
</array>
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
'''),
          HeadingView(text: 'Flutter'),
          CodeView(code: '''
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request permission for iOS
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  print('User granted permission: \${settings.authorizationStatus}');
  
  // Handle messages while the app is in the foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message received: \${message.messageId}');
    // Handle your message here
  });

  // Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages
  print('Background message received: \${message.messageId}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Push Notification Demo'),
        ),
        body: Center(
          child: Text('Waiting for messages...'),
        ),
      ),
    );
  }
}
'''),


        ],
      ),
    );
  }
}
