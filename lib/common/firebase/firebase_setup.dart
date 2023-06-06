import 'package:counter2023/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseSetUp {
  static Future<void> init() async {
    //TODO : firebase_options.dart는 cli에서 자동으로 생성
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static FirebaseAnalyticsObserver getAnalytics() {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);
    return observer;
  }
}
