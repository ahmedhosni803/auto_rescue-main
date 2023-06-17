import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/appColors.dart';
import '../../sharedWidgets/spaces/customSizedBox.dart';
import '../../sharedWidgets/widgets/AppTexts.dart';

class ShowMessages extends StatefulWidget {
  const ShowMessages({super.key});

  @override
  State<ShowMessages> createState() => _ShowMessagesState();
}

class _ShowMessagesState extends State<ShowMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, 35.h),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            customSizedBox(0.0, 35.h),
            Center(
              child: AppTexts().customAppText(
                  title: "Messages", size: 25.sp, color: Colors.white),
            ),
            customSizedBox(0.0, 15.h),
            Container(
              width: double.infinity,
              height: 545.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.mark_as_unread_sharp,
                                color: Colors.cyan,
                              ),
                              AppTexts().customAppNormalText(
                                  title: "19.24",
                                  size: 15.sp,
                                  color: Colors.grey)
                            ],
                          ),
                          AppTexts().customAppNormalText(
                              title:
                                  "I started with 100Dollar and in24hours I was credited with 2,500Dollar including 100Dollar, nOw I have got 10x my start up Capital.",
                              size: 20.sp,
                              textOverflow: TextOverflow.ellipsis),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
