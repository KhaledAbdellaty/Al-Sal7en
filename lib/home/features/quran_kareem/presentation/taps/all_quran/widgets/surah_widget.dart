import 'package:flutter/material.dart';
import '../../../../../../../core/strings/routes.dart';
import '../../../../domain/entity/surah.dart';

class SurahWidget extends StatelessWidget {
  final SurahData surahData;

  const SurahWidget({
    Key? key,
    required this.surahData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        surahScreen,
        arguments: surahData.ayahData.first.page - 1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(surahData.name),
          const Divider(),
        ],
      ),
    );
  }
}
