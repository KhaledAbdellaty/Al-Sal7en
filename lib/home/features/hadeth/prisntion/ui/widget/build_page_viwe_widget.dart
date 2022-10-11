import 'package:aqra_application/hadeth/domen/entites/hadith.dart';
import 'package:aqra_application/hadeth/prisntion/bloc/hadith/hadith_cubit.dart';
import 'package:aqra_application/hadeth/prisntion/ui/widget/loding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPageViweWidget extends StatefulWidget {
  BuildPageViweWidget({
    super.key,
    required this.data,
    required this.bookSlug,
    required this.chapterNumber,
  });
  List<HadithChapterInfo> data;
  String chapterNumber;
  String bookSlug;

  @override
  State<BuildPageViweWidget> createState() => _BuildPageViweWidgetState();
}

class _BuildPageViweWidgetState extends State<BuildPageViweWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: BlocProvider.of<HadithCubit>(context).controller,
      itemCount: widget.data.length + 1,
      onPageChanged: (value) {
        if (value + 1 >= widget.data.length &&
            widget.data.first.hadiths.lastPage > widget.data.length) {
          BlocProvider.of<HadithCubit>(context).getHadith(
              BookSlug: widget.bookSlug,
              chapterNumber: widget.chapterNumber,
              current_page: value + 1);
        }
      },
      itemBuilder: (context, index) {
        if (index < widget.data.length) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("صفحة:" + widget.data[index].hadiths.currentPage.toString()),
              buildListViwe(widget.data[index].hadiths.data),
            ],
          );
        } else {
          if (widget.data[index - 1].hadiths.currentPage ==
              widget.data[index - 1].hadiths.lastPage) {
            return Center(child: Text("انتهى الكتاب"));
          } else {
            return Center(
              child: LodingWidget(),
            );
          }
        }
      },
    );
  }

  Widget buildListViwe(List<HadithData> data) {
    return Expanded(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ItimWidget(
              hadithData: data[index],
              index: index,
            );
          }),
    );
  }

  Widget ItimWidget({required HadithData hadithData, required int index}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.amber[50]),
      child: Column(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: Colors.red[400]),
          ),
          Text(
            hadithData.hadithArabic,
            style: TextStyle(
              fontFamily: "A Suls Regular",
            ),
          ),
        ],
      ),
    );
  }
}
