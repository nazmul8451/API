import 'package:api_practice/gate_method_practiceUsing_model.dart';
import 'package:api_practice/get_method_practice.dart';
import 'package:api_practice/main_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



//All Package imported


void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home:GetMethod_UsingModel(),
      ), // runApp এর ভিতরে DevicePreview
    ),
  );
}