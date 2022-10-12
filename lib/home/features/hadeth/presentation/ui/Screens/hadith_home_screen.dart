import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/strings/routes.dart';
import '../../bloc/book/book_cubit.dart';
import '../widget/loding_widget.dart';

class HadithHomeScreen extends StatelessWidget {
  const HadithHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("الحديث النبوي الشريف"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, searchHadithScreen),
              icon: const Icon(Icons.search_rounded),
            )
          ],
        ),
        body: buildBody());
  }

  buildBody() {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BookLodingState) {
          return const Center(child: LodingWidget());
        } else if (state is DoneBookState) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              itemCount: state.books.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        state.books[index].bookName,
                        style: TextStyle(
                            fontFamily: "A Suls Regular", fontSize: 20),
                      ),
                      Image.asset("assets/images/book.png"),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      chapterScreen,
                      arguments: <String, dynamic>{
                        'bookName': state.books[index].bookName,
                        'bookSlug': state.books[index].bookSlug,
                      },
                    );
                  },
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text("something went wrong"),
          );
        }
      },
    );
  }
}
