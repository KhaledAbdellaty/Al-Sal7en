import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/injection_container.dart';
import 'package:untitled/core/strings/routes.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => inj<SurahCubit>()..getAllBookMarks(),
      child: BlocBuilder<SurahCubit, SurahState>(
        buildWhen: (previous, current) =>
            current.ayahsBookMarksList != previous.ayahsBookMarksList,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<SurahCubit>().getAllBookMarks(),
            child: ListView.builder(
              itemCount: state.ayahsBookMarksList.length,
              // physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onLongPress: () => context
                    .read<SurahCubit>()
                    .removeFromBookMark(
                        ayahText: state.ayahsBookMarksList[index].text),
                onTap: () => Navigator.pushNamed(
                  context,
                  surahScreen,
                  arguments: state.ayahsBookMarksList[index].page - 1,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 20,
                          child: Text(state.ayahsBookMarksList[index].text)),
                      Text(' سورة رقم' +
                          ' ' +
                          state.ayahsBookMarksList[index].numberOfSurah
                              .toString()),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
