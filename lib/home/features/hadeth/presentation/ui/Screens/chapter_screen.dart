
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/chapter/chapter_cubit.dart';
import '../../bloc/hadith/hadith_cubit.dart';
import '../widget/loding_widget.dart';
import 'hadith_screen.dart';

class ChapterScreen extends StatelessWidget {
  String bookName;
  ChapterScreen({super.key, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookName),
        centerTitle: true,
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context1) {
    return BlocConsumer<ChapterCubit, ChapterState>(
      listener: (context, state) {
        if (state is ErrorState) {
          showDialog<String>(
            context: context1,
            builder: (context) {
              return AlertDialog(
                title: Text(state.massegesError),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is LodingState) {
          return Center(
            child: LodingWidget(),
          );
        } else if (state is DoneState) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: state.chapters.chapters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          state.chapters.chapters[index].chapterNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/book.png",
                              height: 30,
                            ),
                            Text(
                              state.chapters.chapters[index].chapterArabic,
                              style: TextStyle(
                                fontFamily: "A Suls Regular",
                              ),
                            ),
                            Image.asset(
                              "assets/images/book.png",
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      BlocProvider.of<HadithCubit>(context)
                          .datawithPage
                          .clear();
                      BlocProvider.of<HadithCubit>(context).getHadith(
                          BookSlug: state.chapters.chapters[index].bookSlug,
                          chapterNumber:
                              state.chapters.chapters[index].chapterNumber);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HadithScreen(
                              chapter: state.chapters.chapters[index],
                              bookSlug: state.chapters.chapters[index].bookSlug,
                              chapterNumber:
                                  state.chapters.chapters[index].chapterNumber,
                            ),
                          ));
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is ErrorState) {
          return Text(" agen ");
        } else {
          Center(
            child: LodingWidget(),
          );
        }
        return LodingWidget();
      },
    );
  }
}
