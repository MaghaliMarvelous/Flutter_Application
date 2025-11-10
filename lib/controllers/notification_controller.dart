import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  var notificationTitle = ''.obs;
  var notificationBody = ''.obs;
  var lastMessage = ''.obs; // ✅ Added
  var token = ''.obs;       // ✅ Added

  @override
  void onInit() {
    super.onInit();
    _initializeFirebase();
    _setupLocalNotifications();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('🔔 Permission granted');

      String? fcmToken = await _messaging.getToken();
      token.value = fcmToken ?? 'No token available';
      print('📱 FCM Token: ${token.value}');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          notificationTitle.value = message.notification!.title ?? '';
          notificationBody.value = message.notification!.body ?? '';
          lastMessage.value = '${notificationTitle.value}: ${notificationBody.value}';

          _showLocalNotification(notificationTitle.value, notificationBody.value);
        }
      });
    }
  }

  void _setupLocalNotifications() {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    _localNotifications.initialize(initSettings);
  }

  void _showLocalNotification(String title, String body) {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    _localNotifications.show(0, title, body, notificationDetails);
  }
}
