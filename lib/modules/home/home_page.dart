import 'package:flutter/material.dart';
import 'package:flutter_movies/application/ui/filmes_app_icons_icons.dart';
import 'package:flutter_movies/application/ui/theme_extensions.dart';
import 'package:flutter_movies/modules/favorites/favorites_page.dart';
import 'package:flutter_movies/modules/home/home_controller.dart';
import 'package:flutter_movies/modules/movies/movies_page.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            onTap: controller.goToPage,
            selectedItemColor: context.themeColorRed,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.pageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: "Filmes",
              ),
              BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty),
                label: "Favoritos",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: "Sair",
              ),
            ],
          );
        },
      ),
      body: Navigator(
        initialRoute: "/movies",
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == "/movies" || settings.name == "/") {
            return GetPageRoute(
              settings: settings,
              page: () => MoviesPage(),
            );
          }
          if (settings.name == "/favorites") {
            return GetPageRoute(
              settings: settings,
              page: () => FavoritesPage(),
            );
          }
          return null;
        },
      ),
    );
  }
}
