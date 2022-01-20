import 'package:flutter/material.dart';
import 'package:alpha/main_ui/main_ui.dart';
import 'package:alpha/pages/ad.dart';
import 'package:alpha/pages/settings.dart';
import 'package:alpha/test.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainUi());
      case '/test':
        return MaterialPageRoute(builder: (_) => const TestPage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case '/createAd':
        return MaterialPageRoute(builder: (_) => const CreateAdPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found! LoL'),
        ),
      );
    });
  }

}