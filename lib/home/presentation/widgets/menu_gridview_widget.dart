import 'package:flutter/material.dart';
import 'package:untitled/core/strings/routes.dart';

class MenuGridViewWidget extends StatelessWidget {
  MenuGridViewWidget({Key? key}) : super(key: key);
  Map<String, String> ss = {
    'أذكار المساء': 'assets/images/night.png',
    'أحاديث': 'assets/images/day.png',
    'القرأن الكريم': 'assets/images/quran_kareem.png',
    'اسماءالله الحسنى': 'assets/images/Component 2.png',
    'تواصل معنا': 'assets/images/contact_us.png',
    'أدعية': 'assets/images/Component 3.png',
  };
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          backGroundAsset: ss.values.elementAt(index),
          title: ss.keys.elementAt(index),
          onTap: () => index == 0
              ? Navigator.pushNamed(context, azkarScreen)
              : index == 1
                  ? Navigator.pushNamed(context, hadithHomeScreen)
                  : index == 2
                      ? Navigator.pushNamed(context, quranKareemScreen)
                      : index == 3
                          ? Navigator.pushNamed(context, asmaAlahScreen)
                          : null,
        ),
      ),
    );
  }
}

class MenuContainerGridView extends StatelessWidget {
  const MenuContainerGridView({
    required this.backGroundAsset,
    required this.title,
    required this.onTap,
    //  this.ns = true,
    Key? key,
  }) : super(key: key);
  final String backGroundAsset;
  final String title;
  final VoidCallback onTap;
  // final bool ns;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            title,
            style: const TextStyle(
              fontFamily: 'georgia',
              fontSize: 20,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ]),
    );
  }
}
