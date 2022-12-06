import 'package:fluro/fluro.dart';
import 'package:innenu/router/i_router.dart';
import 'package:innenu/tests/pages/carousel.dart';
import 'package:innenu/tests/pages/carousel_json.dart';
import 'package:innenu/tests/pages/doc.dart';
import 'package:innenu/tests/pages/footer.dart';
import 'package:innenu/tests/pages/footer_json.dart';
import 'package:innenu/tests/pages/grid.dart';
import 'package:innenu/tests/pages/grid_json.dart';
import 'package:innenu/tests/pages/image.dart';
import 'package:innenu/tests/pages/image_json.dart';
import 'package:innenu/tests/pages/list.dart';
import 'package:innenu/tests/pages/list_json.dart';
import 'package:innenu/tests/pages/nav.dart';
import 'package:innenu/tests/pages/nav_json.dart';
import 'package:innenu/tests/pages/phone.dart';
import 'package:innenu/tests/pages/tests.dart';
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
  static String footerPage = '/test/component/footer';
  static String footerJSONPage = '/test/component/footerJSON';
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
          handler: Handler(handlerFunc: (_, __) => const ComponentTest()))
      ..define(textThemePage,
          handler: Handler(handlerFunc: (_, __) => const TextThemeTest()))
      ..define(carouselPage,
          handler: Handler(handlerFunc: (_, __) => const CarouselTest()))
      ..define(carouselJSONPage,
          handler: Handler(handlerFunc: (_, __) => const CarouselJSONTest()))
      ..define(docPage,
          handler: Handler(handlerFunc: (_, __) => const DocTest()))
      ..define(footerPage,
          handler: Handler(handlerFunc: (_, __) => const FootTest()))
      ..define(footerJSONPage,
          handler: Handler(handlerFunc: (_, __) => const FootJSONTest()))
      ..define(gridPage,
          handler: Handler(handlerFunc: (_, __) => const GridTest()))
      ..define(gridJSONPage,
          handler: Handler(handlerFunc: (_, __) => const GridJSONTest()))
      ..define(imagePage,
          handler: Handler(handlerFunc: (_, __) => const ImageTest()))
      ..define(imageJSONPage,
          handler: Handler(handlerFunc: (_, __) => const ImageJSONTest()))
      ..define(listPage,
          handler: Handler(handlerFunc: (_, __) => const ListTest()))
      ..define(listJSONPage,
          handler: Handler(handlerFunc: (_, __) => const ListJSONTest()))
      ..define(navPage,
          handler: Handler(handlerFunc: (_, __) => const HeadTest()))
      ..define(navJSONPage,
          handler: Handler(handlerFunc: (_, __) => const HeadJSONTest()))
      ..define(titlePage,
          handler: Handler(handlerFunc: (_, __) => const TitleTest()))
      ..define(titleJSONPage,
          handler: Handler(handlerFunc: (_, __) => const TitleJSONTest()))
      ..define(textPage,
          handler: Handler(handlerFunc: (_, __) => const TextTest()))
      ..define(textJSONPage,
          handler: Handler(handlerFunc: (_, __) => const TextJSONTest()))
      ..define(phonePage,
          handler: Handler(handlerFunc: (_, __) => const PhoneTest()))
      ..define(pathPage,
          handler: Handler(handlerFunc: (_, __) => const PathTest()));
  }
}
