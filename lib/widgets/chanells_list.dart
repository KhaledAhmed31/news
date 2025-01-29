import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/api_services.dart';
import 'package:news/common/my_colors.dart';
import 'package:news/widgets/news_list.dart';

class ChanellsList extends StatefulWidget {
  const ChanellsList({super.key, required this.categoryId});
  final String categoryId;
  @override
  State<ChanellsList> createState() => _ChanellsListState();
}

class _ChanellsListState extends State<ChanellsList> {
  String? selectedChanell;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getSource(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            selectedChanell == null) {
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
          selectedChanell ??= snapshot.data!.sources![0].id ?? '';
          return Column(
            children: [
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  itemCount: snapshot.data!.sources!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r)),
                      selectedColor: Colors.green,
                      onSelected: (value) {
                        setState(() {
                          selectedChanell = snapshot.data!.sources![index].id ?? '';
                        });
                      },
                      label: Text(snapshot.data!.sources![index].name ?? 'unknown'),
                      selected: snapshot.data!.sources![index].id == selectedChanell,
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      labelStyle: TextStyle(
                          color: snapshot.data!.sources![index].id == selectedChanell
                              ? Colors.white
                              : Colors.green),
                    ),
                  ),
                ),
              ),
              NewsList(selectedSourceId: selectedChanell,)
            ],
          );
        }
      },
    );
  }
}
