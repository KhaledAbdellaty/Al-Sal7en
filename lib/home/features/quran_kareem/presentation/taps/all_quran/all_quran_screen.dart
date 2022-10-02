import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:untitled/home/features/quran_kareem/presentation/taps/all_quran/widgets/surah_widget.dart';


class AllQuran extends StatelessWidget {
  const AllQuran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: state.surahData.length,
            itemBuilder: (context, index) {
              return SurahWidget(
                surahData: state.surahData[index],
     
              );
            },
          ),
        );
      },
    );
  }
}
