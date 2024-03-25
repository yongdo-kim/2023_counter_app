Flutter 프로젝트입니다.
DDD 구조 형태로 파일구조를 생성하였습니다.

lib
- common (다양한 프로젝트를 제작하기 위해 필수적으로 사용되는 부분을 모듈화 하였습니다)
  - admob
  - firebase
  - hive
  - injectable
- design ( color, font, 다른 widget)
  - button
  - card
  - appbar
  - etc
- counter (해당 프로젝트의 메인에 해당하는 곳입니다, 도메인 별로 계속해서 추가할 수 있습니다.
  - presentation (ui 담당)
  - application (비지니스 로직 담당 flutter_bloc)
  - domain (해당 프로젝트의 주제가 담기는 곳)
  - infrastructure (repo, local 데이터 통신, 보관 담당)
      - api call이 없는 유틸앱이므로, 로컬DB인 hive가 infrastructure를 담당합니다
- main.dart



pubspec.yaml에는 사용된 라이브러리들을 주제별로 나누었습니다.

예시)
  # coomon
  cupertino_icons: ^1.0.2
  flutter_bloc: ^8.1.3
  get_it: ^7.6.0
  injectable: ^2.1.1
  equatable: ^2.0.5
  device_info_plus: ^9.0.1
  font_awesome_flutter: ^10.4.0

  #firebase
  google_mobile_ads: ^3.0.0
  firebase_core: ^2.12.0
  firebase_analytics: ^10.4.1
  firebase_crashlytics: ^3.3.1
