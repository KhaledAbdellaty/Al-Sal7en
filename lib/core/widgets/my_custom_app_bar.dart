import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/strings/colors.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:untitled/home/presentation/blocs/cubit/app_bar_cubit.dart';

class MyCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  MyCustomAppBar({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: mainColor,
          title: state.isSearch
              ? searchTextField()
              : Center(
                  child: Text('قرأن'),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: !state.isSearch
                  ? IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => _startSearch(context))
                  : IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => _stopSearching(context),
                    ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: mintgreenColor,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: mintgreenColor,
            tabs: [
              tap('سورة'),
              tap('الجزء'),
              tap('المرجعيات'),
            ],
          ),
        );
      },
    );
  }

  Widget searchTextField() {
    return BlocBuilder<AppBarCubit, AppBarState>(
      builder: (context, state) {
        return TextFormField(
          controller: searchController,
          autofocus: true,
          autocorrect: true,
          onChanged: (surahSearced) {
            context
                .read<SurahCubit>()
                .loadSurahSeacrched(surahName: surahSearced);
          },
          decoration: const InputDecoration(
            hintText: 'ابحث عن السورة ...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: mintgreenColor),
          ),
          cursorColor: mintgreenColor,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        );
      },
    );
  }

  Widget tap(String title) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _stopSearching(BuildContext context) {
    searchController.clear();
    BlocProvider.of<AppBarCubit>(context).stopSearch();
  }

  Widget _startSearch(BuildContext context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: () => _stopSearching(context)),
    );

    BlocProvider.of<AppBarCubit>(context).startSearch();
    return searchTextField();
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
