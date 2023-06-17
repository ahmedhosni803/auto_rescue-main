import 'package:auto_doctor/data/Apis/DataCenter/User/SendRebort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

TextEditingController textController = TextEditingController();

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                customSizedBox(0.0, 60.h),
                AppTexts().customAppText(
                  title: "Send a message",
                  size: 22.sp,
                  color: Color.fromARGB(255, 252, 171, 48),
                ),
                AppTexts().customAppNormalText(
                    title: "Wait for a response in the message box",
                    size: 12.sp,
                    color: Colors.black),
                customSizedBox(0.0, 10.h),
                TextField(
                  maxLines: 4,
                  controller: textController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    labelText: "Leave a message",
                    border: OutlineInputBorder(),
                  ),
                ),
                customSizedBox(0.0, 10.h),
                InkWell(
                  onTap: () {
                    Report.sendSuport(textController.text, context);
                  },
                  child: Container(
                      width: double.infinity,
                      height: 33.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 171, 48),
                          borderRadius: BorderRadius.circular(30.0)),
                      margin: EdgeInsets.symmetric(horizontal: 90.w),
                      child: Center(
                        child: AppTexts().customAppText(
                            title: "SEND", size: 15.sp, color: Colors.white),
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
