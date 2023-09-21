
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configurations/theme/dark_theme_colors.dart';
import '../network/network_info.dart';
import 'button_default.dart';
import 'container_default.dart';


showDialogDefaultErrorCustom(BuildContext context, String title, String desc,
    {bool? isBack, Function()? refresh}) {
   NetworkInfoImpl networkInfo;
  String image = "";
  bool _isback = isBack ?? false;
    image = "assets/images/no_internet.png";
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: Container(
                color: DarkThemeColors.backgroundColor,
                width: double.infinity,
                height: double.infinity,
                child: Stack(children: [
                  ContainerDefault(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(image),
                        SizedBox(height: 3.h),
                        Text(title,
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 2.h),
                        Text( desc,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle( fontSize: 14,
                            fontWeight: FontWeight.w400,),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      margin:
                          EdgeInsets.only(left: 10.w, right: 10.w, bottom: 7.h),
                      child: ButtonDefault(
                        borderRadius: 5,
                        width: 100.w,
                        height: 5.h,
                        title: "Refresh",
                        textColor: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        onPressed:  refresh??
                          () async {

                            if (_isback) {
                              Navigator.of(context).pop();

                            }
                              Navigator.of(context).pop();
                        },
                      ))
                ]),
              ));
        },
      );
    },
  );
}
