import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';

import '../quran.dart';

class AllQuran extends StatefulWidget {
  const AllQuran({Key? key}) : super(key: key);

  @override
  State<AllQuran> createState() => _AllQuranState();
}

class _AllQuranState extends State<AllQuran> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahState>(
          builder: (context, state) {
            return ListView.builder(git
              itemCount: state.surahData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranScreen(
                          pageNo: state.surahData[index].ayahData.first.page,
                        ),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.surahData[index].name),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
