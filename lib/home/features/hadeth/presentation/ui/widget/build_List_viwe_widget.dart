
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/search_hadith.dart';
import '../../bloc/save_hadith/save_hadith_cubit.dart';
import '../../bloc/search/search_cubit.dart';
import 'loding_widget.dart';

class BuildListViewWidget extends StatefulWidget {
  const BuildListViewWidget({super.key, required this.data});
  final List<SearchHadith> data;

  @override
  State<BuildListViewWidget> createState() => _BuildListViewWidgetState();
}

class _BuildListViewWidgetState extends State<BuildListViewWidget> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).cont();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);

    return ListView.builder(
      controller: BlocProvider.of<SearchCubit>(context).controller,
      itemCount: widget.data.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.data.length) {
          return ItimWidget(index: index + 1, searchHadith: widget.data[index]);
        } else {
          return Center(
            child: LodingWidget(),
          );
        }
      },
    );
  }

  Widget ItimWidget({
    required SearchHadith searchHadith,
    required int index,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.amber[50]),
      child: Column(
        children: [
        
          IconButton(
              onPressed: () {
                BlocProvider.of<SaveHadithCubit>(context)
                    .saveHadith(searchHadith);
              },
              icon: Icon(Icons.star)),
          information(date: searchHadith.elRawi, titel: " : الراوي "),
          information(date: searchHadith.grade, titel: " : صحة الحديث "),
          information(date: searchHadith.elMohdith, titel: " : المحدث "),
          information(date: searchHadith.source, titel: " : المصدر "),
          information(date: searchHadith.numberOrPage, titel: " : صفحة "),
          Text(
            searchHadith.hadith,
            style: TextStyle(
              fontFamily: "A Suls Regular",
            ),
          ),
        ],
      ),
    );
  }

  information({required String titel, required String date}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            date,
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.red[400]),
          ),
        ),
        Text(
          titel,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
