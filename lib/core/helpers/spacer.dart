import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySpacer {
  MySpacer._();
  static SizedBox vertical(double height) => SizedBox(height: height.h);

  static SizedBox horizontal(double width) => SizedBox(width: width.w);
}
