import 'package:flutter_application_pplg1_20/bindings/calculator_binding.dart';
import 'package:flutter_application_pplg1_20/bindings/contact_binding.dart';
import 'package:flutter_application_pplg1_20/bindings/example_binding.dart';
import 'package:flutter_application_pplg1_20/bindings/login_binding.dart';
import 'package:flutter_application_pplg1_20/bindings/notification_binding.dart';
import 'package:flutter_application_pplg1_20/bindings/premier_binding.dart';
import 'package:flutter_application_pplg1_20/bindings/splashscreen_binding.dart';
import 'package:flutter_application_pplg1_20/login_page.dart';
import 'package:flutter_application_pplg1_20/pages/contact_page.dart';
import 'package:flutter_application_pplg1_20/pages/example_page.dart';
import 'package:flutter_application_pplg1_20/pages/notification_page.dart';
import 'package:flutter_application_pplg1_20/pages/profile_page.dart';
import 'package:flutter_application_pplg1_20/pages/splashscreen_page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_pplg1_20/pages/calculator.page.dart';
import 'package:flutter_application_pplg1_20/pages/football_pages.dart'; 
import 'package:flutter_application_pplg1_20/pages/football_edit_page.dart';
import 'package:flutter_application_pplg1_20/pages/mainmenu_pages.dart';
import 'package:flutter_application_pplg1_20/routes/routes.dart';

class AppPages {
  static final pages = [
    
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage(), binding: CalculatorBinding()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage(), binding: CalculatorBinding()),
    GetPage(name: AppRoutes.footballeditplayers, page: () => EditFootballPage(),binding: CalculatorBinding()),
    GetPage(name: AppRoutes.mainmenu, page: () => MainmenuPages()),
    GetPage(name: AppRoutes.splashscreen, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.splashscreen, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.contact, page: () => ContactPage(), binding: ContactBinding()),
    GetPage(name: AppRoutes.examplescreen, page: () => ExamplePage(), binding: ExampleBinding()),
    GetPage(name: AppRoutes.loginapi, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.notificationpage, page: () => NotificationPage(), binding: NotificationBinding()),
    GetPage(name: AppRoutes.premiertable, page: () => FootballPage(), binding: PremierBinding()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    
  ];
}
