import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_all_surahs.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_surah_by_page.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

import '../../../../core/injection_container.dart';

class SurahScreen extends StatelessWidget {
  int pageNo;
  ArabicNumbers arabicNumbers = ArabicNumbers();
  SurahScreen({Key? key, required this.pageNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj<SurahCubit>()..loadSurahByPage(pageNo),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<SurahCubit, SurahState>(
              builder: (context, state) {
                final List<int> numbers = [];
                state.ayahsData.forEach((element) {
                  element.numberOfSurah == 1
                      ? numbers.add(element.numberOfSurah)
                      : null;
                });

                return InteractiveViewer(
                  clipBehavior: Clip.none,
                  child: PageView.builder(
                    controller: PageController(initialPage: pageNo),
                    onPageChanged: (value) {
                      print('page no: $value');
                      BlocProvider.of<SurahCubit>(context)
                          .loadSurahByPage(value);
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(state.surah.name)),
                            ],
                          ),
                          Expanded(
                            flex: 26,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.amber,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                              ),
                              child: Column(
                                children: [
                                  numbers.isNotEmpty
                                      ? Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text('بسم الله الرحمن الرحيم'),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    textScaleFactor: 1,
                                    maxLines: 16,
                                    textDirection: TextDirection.rtl,
                                    textAlign: state.ayahsData.length - 1 <= 6
                                        ? TextAlign.center
                                        : TextAlign.justify,
                                    text: TextSpan(
                                      children: [
                                        for (var i = 0;
                                            i <= state.ayahsData.length - 1;
                                            i++) ...{
                                          TextSpan(
                                            text: ' ' +
                                                state.ayahsData[i].text +
                                                ' ',
                                            style: const TextStyle(
                                              textBaseline:
                                                  TextBaseline.ideographic,
                                              height: 1.8,
                                              fontFamily: 'UthmanicHafs',
                                              fontSize: 21,
                                              leadingDistribution:
                                                  TextLeadingDistribution.even,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: InkWell(
                                                onDoubleTap: () => context
                                                    .read<SurahCubit>()
                                                    .addToBookMark(
                                                        ayahData:
                                                            state.ayahsData[i]),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 3),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/sympol.svg',
                                                        width: 33,
                                                        height: 30,
                                                      ),
                                                      Positioned(
                                                        child: Text(
                                                          arabicNumbers
                                                              .convert(state
                                                                  .ayahsData[i]
                                                                  .numberOfSurah)
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          textScaleFactor: i
                                                                      .toString()
                                                                      .length <=
                                                                  2
                                                              ? 1
                                                              : .8,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        }
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(state.pageNo),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
