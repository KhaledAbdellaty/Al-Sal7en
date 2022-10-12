
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/save_hadith/save_hadith_cubit.dart';
import '../../bloc/search/search_cubit.dart';
import '../widget/build_List_viwe_widget.dart';
import '../widget/loding_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              textFormWidget(context),
              const SizedBox(
                height: 15,
              ),
              IconButton(
                  onPressed: () {
                 //   BlocProvider.of<SaveHadithCubit>(context).gethadithDB();
                  },
                  icon: Icon(Icons.leaderboard)),
              buildBloc(context),
            ],
          )),
    ));
  }

  textFormWidget(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end,
      controller: BlocProvider.of<SearchCubit>(context).vlaueSearch,
      decoration: InputDecoration(
        hintText: "نص الحديث",
        prefixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchCubit>(context).date.clear();
            BlocProvider.of<SearchCubit>(context).gitValueSearch();
          },
          icon: const Icon(
            Icons.search,
            color: Colors.redAccent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  buildBloc(BuildContext context1) {
    return Expanded(
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchErrorState) {
            ScaffoldMessenger.of(context1).showSnackBar(
              SnackBar(
                content: Text(state.massegeError),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SearchLodingState &&
              BlocProvider.of<SearchCubit>(context1).date.isEmpty) {
            print("SearchLodingState");
            return const Center(
              child: LodingWidget(),
            );
          } else if (state is SearchInitial) {
            print("SearchInitial");

            return Center(
              child: Image.asset(
                "assets/images/ramadan.png",
                height: 100,
                width: 100,
              ),
            );
          } else if (state is SearchErrorState) {
            print("SearchErrorState");

            return const Center(
              child: Icon(
                Icons.stream_rounded,
                color: Colors.red,
                size: 70,
              ),
            );
          } else if (state is SearchNoDateState) {
            print("SearchNoDateState");

            return Center(
              child: Column(
                children: [
                  const Text("NO Data ,try agen"),
                  const Icon(Icons.error_outline),
                ],
              ),
            );
          } else if (state is SearchDoneState) {
            print("SearchDoneState");
            print(state.date.length);
            //return Icon(Icons.done);
            return BuildListViewWidget(data: state.date);
          } else {
            print("No State=");
            return BuildListViewWidget(
                data: BlocProvider.of<SearchCubit>(context1).date);
          }
        },
      ),
    );
  }
}
