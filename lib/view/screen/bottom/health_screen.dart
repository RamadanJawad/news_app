import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_controller.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/screen/web_screen.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
        child: FutureBuilder<List<News>>(
          future: ApiController().getNews("health"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.green,
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Get.to(() => WebScreen(
                                url: snapshot.data![index].url!,
                              ));
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 120.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10).r,
                                  image: DecorationImage(
                                      image: NetworkImage(snapshot
                                              .data![index].urlToImage ??
                                          "https://w7.pngwing.com/pngs/666/325/png-transparent-health-care-women-s-health-mental-health-health-professional-health-thumbnail.png"),
                                      fit: BoxFit.cover),
                                  border: Border.all(color: Colors.grey)),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 120.h,
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data![index].title!,
                                      textDirection: TextDirection.rtl,
                                      maxLines: 3,
                                      style: GoogleFonts.cairo(
                                          fontSize: 16.sp,
                                          textStyle: TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    ),
                                    Text(
                                      snapshot.data![index].description ?? "",
                                      style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          color: Colors.grey,
                                          textStyle: TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
                  });
            }
            return const Text("no data");
          },
        ),
      )),
    );
  }
}
