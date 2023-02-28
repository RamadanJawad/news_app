import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_controller.dart';
import 'package:news_app/model/news.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<List<News>>(
        future: ApiController().getNews("sports"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(color: Colors.blue),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     
                    },
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: 150.h,
                              child: snapshot.data![index].urlToImage != null
                                  ? Image.network(
                                      snapshot.data![index].url.toString(),
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset("images/sport.png")),
                          Text(
                            snapshot.data![index].title.toString(),
                            style: GoogleFonts.cairo(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            snapshot.data![index].publishedAt.toString(),
                            style: GoogleFonts.cairo(
                                fontSize: 15.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(child: Text("no data"));
        },
      ),
    ));
  }
}
