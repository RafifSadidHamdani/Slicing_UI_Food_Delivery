import 'package:flutter/material.dart';
import 'package:food_delivery/core.dart';
import 'package:food_delivery/presentation/ui/emoney/cart/view/em_cart_view.dart';
import 'package:food_delivery/presentation/ui/emoney/dashboard/view/em_dashboard_view.dart';
import 'package:food_delivery/presentation/ui/emoney/main_navigation/controller/em_main_navigation_controller.dart';

class EmMainNavigationView extends StatefulWidget {
  const EmMainNavigationView({super.key});

  Widget build(context, EmMainNavigationController controller) {
    controller.view = this;

    Widget buildNavItem(IconData icon, String label, int index) {
      return controller.selectedIndex == index
          ? GestureDetector(
              onTap: () => controller.updateIndex(index),
              child: Container(
                padding: const EdgeInsets.only(right: 15),
                decoration: const BoxDecoration(
                  color: Color(0xffeeeeee),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xff000000),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : IconButton(
              onPressed: () => controller.updateIndex(index),
              icon: Icon(
                icon,
                color: const Color(0xff000000),
              ),
            );
    }

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            const EmDashboardView(),
            const EmCartView(),
            Container(
              color: Colors.red,
            ),
            Container(),
          ],
        ),
        bottomNavigationBar: Visibility(
          visible: controller.selectedIndex != 1,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(Icons.home_filled, "Home", 0),
                buildNavItem(Icons.shopping_cart, "My Chart", 1),
                buildNavItem(Icons.notifications, "Notification", 2),
                buildNavItem(Icons.person, "Profile", 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<EmMainNavigationView> createState() => EmMainNavigationController();
}
