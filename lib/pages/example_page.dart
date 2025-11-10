import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_pplg1_20/controllers/example_controller.dart';
import 'package:flutter_application_pplg1_20/pages/mobile/example_mobile.dart';
import 'package:flutter_application_pplg1_20/pages/widescreen/example_widescreen.dart';
import 'package:get/get.dart';


class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});
  final controller = Get.put(ExampleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:LayoutBuilder(
      builder: (context,constraints){
        //detection widthnya
        controller.updateLayout(constraints);
        //transforming load page
        return Obx(()=> controller.isMobile.value 
        ? ExampleMobile() 
        : ExampleWidescreen());
      }),
    );
  }
}