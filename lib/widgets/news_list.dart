import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/api_services.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/widgets/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, this.selectedSourceId});
  final String? selectedSourceId;
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: MediaQuery.of(context).size.height-200.h,
      child: FutureBuilder(
        future: ApiServices.getNews(selectedSourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyColors.prim,
              ),
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 8),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) => NewsCard(
                article: snapshot.data!.articles![index],
              ),
            );
          }
        },
      ),
    );
  }
}
