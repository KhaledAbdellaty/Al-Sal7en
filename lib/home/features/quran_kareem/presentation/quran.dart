import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import '../../../../core/injection_container.dart';

class SurahScreen extends StatelessWidget {
  int pageNo;
  ArabicNumbers arabicNumbers = ArabicNumbers();
  SurahScreen({Key? key, required this.pageNo}) : super(key: key);
  final textRecognizer = DoubleTapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj<SurahCubit>()
        ..loadSurahByPage(pageNo)
        ..getAllBookMarks(),
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
              print(state.pageNo);
              return InteractiveViewer(
                clipBehavior: Clip.none,
                child: PageView.builder(
                  controller: PageController(initialPage: pageNo),
                  onPageChanged: (value) {
                    //  print('page no: $value');
                    BlocProvider.of<SurahCubit>(context).loadSurahByPage(value);
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
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  maxLines: 17,
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: [
                                      ...state.ayahsData.map((e) {
                                        return TextSpan(
                                          recognizer:
                                              LongPressGestureRecognizer(
                                            duration: const Duration(
                                              milliseconds: 1000,
                                            ),
                                          )..onLongPress = () {
                                                  context
                                                      .read<SurahCubit>()
                                                      .addToBookMark(
                                                          ayahData: e);
                                                },
                                          text: e.text,
                                          style: TextStyle(
                                            //  letterSpacing: 0.20,

                                            fontFamily: 'UthmanicHafs',
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            fontSize: 20,
                                            color: Colors.black87,
                                            backgroundColor: state
                                                    .ayahsBookMarksList
                                                    .any((element) =>
                                                        element.text == e.text)
                                                ? Colors.black.withOpacity(0.2)
                                                : Colors.white,
                                          ),
                                          children: [
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
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
                                                            .convert(
                                                                e.numberOfSurah)
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: e
                                                                    .numberOfSurah
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
                                            ),
                                          ],
                                        );
                                      }).toList(),
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
    );
  }
}
