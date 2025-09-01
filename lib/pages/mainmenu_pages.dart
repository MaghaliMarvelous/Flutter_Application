import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/Fragments/history_fragment.dart';
import 'package:flutter_application_pplg1_20/Fragments/home_fragment.dart';
import 'package:flutter_application_pplg1_20/Fragments/profile_fragment.dart';
import 'package:flutter_application_pplg1_20/controllers/mainemenu_controller.dart';
import 'package:get/get.dart';

class MainmenuPages extends StatelessWidget {
  MainmenuPages({super.key});

  final MainemenuController mainemenuController = Get.put(MainemenuController());

  final List<Widget> fragments = [
    HomeFragment(),
    HistoryFragment(), 
    ProfileFragment(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}