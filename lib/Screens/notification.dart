/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:async';

Future<void> checkDebatesToSendReminder() async {
  try {
    tz.initializeTimeZones();
  // Set the default time zone to India
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));

    // Get the current time
    final currentTime = tz.TZDateTime.now(tz.local);

    // Get debates between (current time - 3 minutes) and (current time - 2 minutes)
    final DateTime startTime = currentTime.subtract(Duration(minutes: 3));
    final DateTime endTime = currentTime.subtract(Duration(minutes: 2));

    // Query debates collection
    final QuerySnapshot debateSnapshot = await FirebaseFirestore.instance
        .collection('debates')
        .where('scheduledDateTime', isGreaterThanOrEqualTo: startTime, isLessThan: endTime)
        .get();

    // Iterate over each debate to send reminder emails
    for (final doc in debateSnapshot.docs) {
      final userId = doc['userId'];

      // Send reminder email
      await sendReminderEmailForDebate(userId);
    }
  } catch (e) {
    print('Error checking debates and sending reminder emails: $e');
  }
}
Future<void> sendReminderEmailForDebate(String userId) async {
  try {
    // Get email associated with the user ID
    String? email = await getEmailFromUserId(userId);

    // If email is available, send reminder email
    if (email != null) {
      // Configure SMTP server details
      final smtpServer = gmail('nexodeb8@gmail.com', '3rd-year');

      // Create the email message
      final message = Message()
        ..from = Address('nexodeb8@gmail.com', 'Nimish')
        ..recipients.add(email)
        ..subject = 'Reminder: Debate Scheduled Soon'
        ..text = 'This is a reminder that your debate is scheduled to start soon.';

      // Send the email
      final sendReport = await send(message, smtpServer);

      // Check if the email sending was not null
      if (sendReport != null) {
        print('Reminder email sent successfully to: $email');
      } else {
        print('Failed to send reminder email to: $email');
      }
    } else {
      // User not found or email not available
      print('User not found or email not available for user ID: $userId');
    }
  } catch (e) {
    // Error sending email
    print('Error sending reminder email: $e');
  }
}


Future<String?> getEmailFromUserId(String userId) async {
  try {
    // Fetch user record from Firestore using the UID
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      // If the user exists, return the email
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      return userData['email'];
    } else {
      // User not found
      return null;
    }
  } catch (e) {
    // Error fetching user
    print('Error fetching user: $e');
    return null;
  }
}
*/



// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:mailer/mailer.dart' as mailer;
// import 'package:mailer/smtp_server.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// void scheduleDebateNotification() async {
//   tz.initializeTimeZones();

//   var androidInitialize = AndroidInitializationSettings('ic_launcher');
//   var initializationSettings = InitializationSettings(android: androidInitialize);
//   var localNotifications = FlutterLocalNotificationsPlugin();

//   localNotifications.initialize(initializationSettings);

//   var scheduledNotificationDateTime = tz.TZDateTime.now(tz.local).add(Duration(minutes: 1));
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//                                             'debate_reminder_channel', 
//                                             'Debate Reminder Channel', 
//                                             channelDescription: 'Channel for debate reminder notifications',
//                                           );

//   NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//   await localNotifications.zonedSchedule(
//     0, 
//     'scheduled title', 
//     'scheduled body', 
//     scheduledNotificationDateTime, 
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true, // Deliver at exact time on Android, even in idle mode
//     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, // Interpret the scheduled date and time as an absolute time
//   );
// }

// void sendEmail(String? payload) async {
//   String username = 'nexodeb8@gmail.com';
//   String password = '3rd-aadwad';

//   final smtpServer = gmail(username, password);
  
//   mailer.Message message = mailer.Message()
//     ..from = mailer.Address(username, 'Your name')
//     ..recipients.add('nice007nj@example.com')
//     ..subject = 'Debate Reminder :: 😀 :: ${DateTime.now()}'
//     ..text = 'This is the body of the email';

//   try {
//     final sendReport = await mailer.send(message, smtpServer);
//     print('Message sent: ' + sendReport.toString());
//   } on mailer.MailerException catch (e) {
//     print('Message not sent. \n'+ e.toString());
//   }
// } 

// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:mailer/mailer.dart' as mailer;
// // import 'package:mailer/smtp_server.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// // import 'package:timezone/timezone.dart' as tz;

// // void scheduleDebateNotification() {
// //   tz.initializeTimeZones();

// //   var androidInitialize = new AndroidInitializationSettings('ic_launcher');
// //   var iOSInitialize = new IOSInitializationSettings();
// //   var initializationSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
// //   var localNotifications = new FlutterLocalNotificationsPlugin();

// //   localNotifications.initialize(initializationSettings, onSelectNotification: sendEmail);

// //   var scheduledNotificationDateTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
// //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //                                             'debate_reminder_channel', 
// //                                             'Debate Reminder Channel', 
// //                                             channelDescription: 'Channel for debate reminder notifications',
// //                                           );

// //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
// //   NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
// //   localNotifications.zonedSchedule(
// //     0, 
// //     'scheduled title', 
// //     'scheduled body', 
// //     scheduledNotificationDateTime, 
// //     platformChannelSpecifics,
// //     androidAllowWhileIdle: true, // Deliver at exact time on Android, even in idle mode
// //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, // Interpret the scheduled date and time as an absolute time
// //   );
// // }

// // void sendEmail(String? payload) async {
// //   String username = 'nexodeb8@gmail.com';
// //   String password = '3rd-year';

// //   final smtpServer = gmail(username, password);
  
// //   mailer.Message message = mailer.Message()
// //     ..from = mailer.Address(username, 'Your name')
// //     ..recipients.add('nice007nj@example.com')
// //     ..subject = 'Debate Reminder :: 😀 :: ${DateTime.now()}'
// //     ..text = 'This is the body of the email';

// //   try {
// //     final sendReport = await mailer.send(message, smtpServer);
// //     print('Message sent: ' + sendReport.toString());
// //   } on mailer.MailerException catch (e) {
// //     print('Message not sent. \n'+ e.toString());
// //   }
// // }




// // // ignore_for_file: prefer_const_constructors

// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:mailer/mailer.dart' as mailer;
// // import 'package:mailer/smtp_server.dart';

// // void main() {
// //   var androidInitialize = new AndroidInitializationSettings('ic_launcher');
// //   var iOSInitialize = new IOSInitializationSettings();
// //   var initializationSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
// //   var localNotifications = new FlutterLocalNotificationsPlugin();

// //   localNotifications.initialize(initializationSettings, onSelectNotification: sendEmail);

// //   var scheduledNotificationDateTime = DateTime.now().add(Duration(minutes: 1));
// //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //                                             'debate_reminder_channel', 
// //                                             'Debate Reminder Channel', 
// //                                             channelDescription: 'Channel for debate reminder notifications',
// //                                           );

// //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
// //   NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
// //   localNotifications.schedule(0, 'scheduled title', 'scheduled body', scheduledNotificationDateTime, platformChannelSpecifics);
// // }

// // void sendEmail(String? payload) async {
// //   String username = 'nexodeb8@gmail.com';
// //   String password = '3rd-year';

// //   final smtpServer = gmail(username, password);
  
// //   mailer.Message message = mailer.Message()
// //     ..from = mailer.Address(username, 'Your name')
// //     ..recipients.add('nice007nj@example.com')
// //     ..subject = 'Debate Reminder :: 😀 :: ${DateTime.now()}'
// //     ..text = 'This is the body of the email';

// //   try {
// //     final sendReport = await mailer.send(message, smtpServer);
// //     print('Message sent: ' + sendReport.toString());
// //   } on mailer.MailerException catch (e) {
// //     print('Message not sent. \n'+ e.toString());
// //   }
// // }
