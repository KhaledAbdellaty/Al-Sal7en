import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/quran_kareem/domain/uses_case/load_surah.dart';
import 'package:untitled/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:untitled/features/quran_kareem/presentation/quran.dart';

class MenuGridViewWidget extends StatelessWidget {
  MenuGridViewWidget({Key? key}) : super(key: key);
  List<String> ss = [
    'assets/images/night.png',
    'assets/images/day.png',
    'assets/images/quran_kareem.png',
    'assets/images/Component 2.png',
    'assets/images/contact_us.png',
    'assets/images/Component 3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 413,
      width: 269,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11,
          mainAxisSpacing: 13,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) => MenuContainerGridView(
          backGroundAsset: ss[index],
        ),
      ),
    );
  }
}

class MenuContainerGridView extends StatelessWidget {
  const MenuContainerGridView({
    required this.backGroundAsset,
    this.ns = true,
    Key? key,
  }) : super(key: key);
  final String backGroundAsset;
  final bool ns;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SurahCubit(loadSurahUseCase: LoadSurahUseCase())..loadSurah(),
            child: QuranScreen(),
          ),
        ),
      ),
      focusColor: Colors.amber,
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(15),
      child: Stack(children: [
        Image.asset(
          backGroundAsset,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'أذكار المساء',
            style: TextStyle(
              fontFamily: 'georgia',
              fontSize: 16,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ]),
    );
  }
}
