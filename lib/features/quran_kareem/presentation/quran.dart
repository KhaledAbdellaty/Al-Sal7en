import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/features/quran_kareem/presentation/cubit/surah_cubit.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<SurahCubit, SurahState>(
        builder: (_, state) {
          if (state is SurahLoaded) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               color: Colors.amber,
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 //  crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     color: Colors.white,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             '${state.surahData.text!.values.elementAt(0)}',
//                             maxLines: 2,
//                             textDirection: TextDirection.rtl,
//                             softWrap: false,
//                             overflow: TextOverflow.clip,
//                             style: TextStyle(),
//                           ),
//                         ),
//                         SvgPicture.asset(
//                           'assets/images/sympol.svg',
//                           width: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
// /*
//    Text(
//                                 '${state.surahData.text!.values.elementAt(index)}',
//                                 maxLines: 2,
//                                 textDirection: TextDirection.rtl,
//                                 softWrap: false,
//                                 overflow: TextOverflow.clip,
//                                 style: TextStyle(),
//                               ),

//                               */
//               //  RichText(
//               //     textDirection: TextDirection.rtl,
//               //     text: TextSpan(
//               //         text:
//               //             '${state.surahData.text!.values.first.toString()} ${state.surahData.text!.keys.first.toString()} ')),
//             );

            return ListView.builder(
              itemBuilder: (context, index) =>
                  Text(state.surahData[index].name),
              itemCount: state.surahData.length,
            );
          } else {
            return Center(
              child: Text('Some thing went wrong'),
            );
          }
        },
      )),
    );
  }
}
