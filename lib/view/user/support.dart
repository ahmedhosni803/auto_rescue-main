import 'package:auto_doctor/view/user/sendMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppImageWidgets.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';
import '../../utils/strings/images.dart';
import 'messages.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 252, 171, 48),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              customSizedBox(0.0, 100.h),
              AppImages().assetImageWithWidthAndHeight(
                  AppImagesPath.IconeApp, 90.w, 80.h),
              customSizedBox(0.0, 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Center(
                          child:
                              Icon(Icons.call, size: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    customSizedBox(12.w, 0.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (v) {
                          return SendMessage();
                        }));
                      },
                      child: Container(
                        width: 50.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Center(
                          child:
                              Icon(Icons.send, size: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    customSizedBox(12.w, 0.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (v) {
                          return ShowMessages();
                        }));
                      },
                      child: Container(
                        width: 50.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Center(
                          child:
                              Icon(Icons.mail, size: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              customSizedBox(0.0, 8.h),
              AppTexts().customAppNormalText(
                  title: "If you have any complaints, you can contact us.",
                  size: 13.sp),
            ],
          ),
        ),
      ),
    );
  }
}
