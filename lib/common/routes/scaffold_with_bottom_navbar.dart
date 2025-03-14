import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/routes.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavbar extends StatelessWidget {
  const ScaffoldWithBottomNavbar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        elevation: NumberConstants.value_10,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: StringConstants.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
            ),
            label: StringConstants.notifications,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_sharp,
            ),
            label: StringConstants.bookmarks,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: StringConstants.profile,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(
            NumberConstants.value_50,
          ),
        ),
        onPressed: () => context.pushNamed(RouteName.editUpdateScreen),
        backgroundColor: Colors.blueGrey[NumberConstants.value_900.toInt()],
        child: Icon(
          Icons.edit_note_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
