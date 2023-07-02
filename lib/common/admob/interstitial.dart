// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Interstitial {
  Function(bool) adLoadCallback;
  Interstitial({
    required this.adLoadCallback,
  });
  InterstitialAd? _interstitialAd;

  //yongdo android interstitial ID
  //TODO : ios 계정이 없기 때문에 우선 안드로이드로 픽스
  final adAndroidUnitId = 'ca-app-pub-2398130378795170/4451126456';

  /// Loads an interstitial ad.
  Future<void> loadAd() async {
    await InterstitialAd.load(
        adUnitId: adAndroidUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) async {
            _interstitialAd = ad;
            if (_interstitialAd != null) {
              await _interstitialAd!.show();
              adLoadCallback(true);
            }
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            adLoadCallback(true);
          },
        ));
  }
}
