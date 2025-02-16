import 'package:flutter/material.dart';
import 'package:food_delivery/core.dart';
import 'package:food_delivery/presentation/ui/emoney/main_navigation/view/em_main_navigation_view.dart';
import 'package:food_delivery/shared/util/theme/theme_emoney.dart';
import 'package:food_delivery/shared/util/theme/theme_food_delivery.dart';
import 'package:food_delivery/shared/util/theme/theme_travel.dart';

class AppListController extends State<AppListView> {
  static late AppListController instance;
  late AppListView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List apps = [
    {
      "label": "Food Delivery",
      "icon": Icons.food_bank,
      "page": const FdMainNavigationView(),
      "theme": getFoodDeliveryTheme(),
    },
    
  ];
}
