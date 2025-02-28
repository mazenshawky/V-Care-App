import 'package:flutter/material.dart';
import 'package:v_care_app/core/di/dependency_injection.dart';
import 'package:v_care_app/v_care_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async{
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(VCareApp(
    appRouter: AppRouter(),
  ));
}
