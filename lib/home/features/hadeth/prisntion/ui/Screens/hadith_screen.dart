import 'package:aqra_application/hadeth/domen/entites/chapter.dart';
import 'package:aqra_application/hadeth/prisntion/bloc/hadith/hadith_cubit.dart';
import 'package:aqra_application/hadeth/prisntion/ui/widget/loding_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/build_page_viwe_widget.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({
    super.key,
    required this.chapter,
    required this.bookSlug,
    required this.chapterNumber,
  });
  final Chapter chapter;
  final String chapterNumber;
  final String bookSlug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.chapterArabic),
        centerTitle: true,
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context1) {
    return BlocConsumer<HadithCubit, HadithState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HadithLodingState &&
            BlocProvider.of<HadithCubit>(context).datawithPage.isEmpty) {
          return const Center(
            child: LodingWidget(),
          );
        } else if (state is HadithDoneState) {
          return BuildPageViweWidget(
            data: state.hadithChapterInfo,
            bookSlug: bookSlug,
            chapterNumber: chapterNumber,
          );
        } else if (state is HadithNoDateState) {
          return Center(
            child: Column(
              children: const [
                Icon(Icons.restart_alt_rounded),
                SizedBox(
                  height: 10,
                ),
                Text("No data ,try agitn"),
              ],
            ),
          );
        } else if (state is HadithErrorState) {
          showDialog(
            context: context1,
            builder: (context1) {
              return AlertDialog(
                title: Text(state.errorMassege),
              );
            },
          );
          return const Center(
            child: Icon(Icons.report_outlined),
          );
        } else {
          var data = BlocProvider.of<HadithCubit>(context).datawithPage;
          return BuildPageViweWidget(
            data: data,
            bookSlug: bookSlug,
            chapterNumber: chapterNumber,
          );
        }
      },
    );
  }
}
