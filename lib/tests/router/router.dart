import 'package:fluro/fluro.dart';
import 'package:innenu/router/i_router.dart';

import 'package:innenu/tests/pages/carousel.dart';
import 'package:innenu/tests/pages/carousel_json.dart';

import 'package:innenu/tests/pages/doc.dart';

import 'package:innenu/tests/pages/foot.dart';
import 'package:innenu/tests/pages/foot_json.dart';

import 'package:innenu/tests/pages/grid.dart';
import 'package:innenu/tests/pages/grid_json.dart';

import 'package:innenu/tests/pages/image.dart';
import 'package:innenu/tests/pages/image_json.dart';

import 'package:innenu/tests/pages/tests.dart';

import 'package:innenu/tests/pages/list.dart';
import 'package:innenu/tests/pages/list_json.dart';

import 'package:innenu/tests/pages/nav.dart';
import 'package:innenu/tests/pages/nav_json.dart';

import 'package:innenu/tests/pages/phone.dart';

import 'package:innenu/tests/pages/text.dart';
import 'package:innenu/tests/pages/text_json.dart';

import 'package:innenu/tests/pages/text_theme.dart';

import 'package:innenu/tests/pages/title.dart';
import 'package:innenu/tests/pages/title_json.dart';
import 'package:innenu/tests/utils/path.dart';

class TestRouter implements IRouterProvider {
  static String textThemePage = '/test/textTheme';
  static String mainPage = '/test/component';
  static String carouselPage = '/test/component/carousel';
  static String carouselJSONPage = '/test/component/carouselJSON';
  static String docPage = '/test/component/doc';
  static String footerPage = '/test/component/foot';
  static String footerJSONPage = '/test/component/footJSON';
  static String gridPage = '/test/component/grid';
  static String gridJSONPage = '/test/component/gridJSON';
  static String imagePage = '/test/component/image';
  static String imageJSONPage = '/test/component/imageJSON';
  static String listPage = '/test/component/list';
  static String listJSONPage = '/test/component/listJSON';
  static String navPage = '/test/component/nav';
  static String navJSONPage = '/test/component/navJSON';
  static String titlePage = '/test/component/title';
  static String titleJSONPage = '/test/component/titleJSON';
  static String textPage = '/test/component/text';
  static String textJSONPage = '/test/component/textJSON';
  static String phonePage = '/test/component/phone';
  static String pathPage = '/test/utils/path';

  @override
  void initRouter(FluroRouter router) {
    router
      ..define(mainPage,
          handler: Handler(handlerFunc: (_, __) => ComponentTest()))
      ..define(textThemePage,
          handler: Handler(handlerFunc: (_, __) => TextThemeTest()))
      ..define(carouselPage,
          handler: Handler(handlerFunc: (_, __) => CarouselTest()))
      ..define(carouselJSONPage,
          handler: Handler(handlerFunc: (_, __) => CarouselJSONTest()))
      ..define(docPage, handler: Handler(handlerFunc: (_, __) => DocTest()))
      ..define(footerPage, handler: Handler(handlerFunc: (_, __) => FootTest()))
      ..define(footerJSONPage,
          handler: Handler(handlerFunc: (_, __) => FootJSONTest()))
      ..define(gridPage, handler: Handler(handlerFunc: (_, __) => GridTest()))
      ..define(gridJSONPage,
          handler: Handler(handlerFunc: (_, __) => GridJSONTest()))
      ..define(imagePage, handler: Handler(handlerFunc: (_, __) => ImageTest()))
      ..define(imageJSONPage,
          handler: Handler(handlerFunc: (_, __) => ImageJSONTest()))
      ..define(listPage, handler: Handler(handlerFunc: (_, __) => ListTest()))
      ..define(listJSONPage,
          handler: Handler(handlerFunc: (_, __) => ListJSONTest()))
      ..define(navPage, handler: Handler(handlerFunc: (_, __) => HeadTest()))
      ..define(navJSONPage,
          handler: Handler(handlerFunc: (_, __) => HeadJSONTest()))
      ..define(titlePage, handler: Handler(handlerFunc: (_, __) => TitleTest()))
      ..define(titleJSONPage,
          handler: Handler(handlerFunc: (_, __) => TitleJSONTest()))
      ..define(textPage, handler: Handler(handlerFunc: (_, __) => TextTest()))
      ..define(textJSONPage,
          handler: Handler(handlerFunc: (_, __) => TextJSONTest()))
      ..define(phonePage, handler: Handler(handlerFunc: (_, __) => PhoneTest()))
      ..define(pathPage,
          handler: Handler(handlerFunc: (_, __) => const PathTest()));
  }
}
