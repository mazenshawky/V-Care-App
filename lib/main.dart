import 'package:flutter/material.dart';
import 'package:v_care_app/core/di/dependency_injection.dart';
import 'package:v_care_app/core/routing/app_router.dart';
import 'package:v_care_app/v_care_app.dart';

void main() {
  setupGetIt();
  runApp(VCareApp(appRouter: AppRouter()));
}
