// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Interstitial {
  Function(bool) adLoadCallback;
  Interstitial({
    required this.adLoadCallback,
  });
  InterstitialAd? _interstitialAd;

  //TODO : ios 계정이 없기 때문에 우선 안드로이드로 픽스

  //testid
  final testAndroidId = 'ca-app-pub-3940256099942544/1033173712';
  final testIosId = 'ca-app-pub-3940256099942544/4411468910';

  /// Loads an interstitial ad.
  Future<void> loadAd() async {
    await InterstitialAd.load(
        adUnitId: testAndroidId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) async {
         
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            if (_interstitialAd != null) {
              await _interstitialAd!.show();
              adLoadCallback(true);
            }
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
          
          },
        ));
  }
}
