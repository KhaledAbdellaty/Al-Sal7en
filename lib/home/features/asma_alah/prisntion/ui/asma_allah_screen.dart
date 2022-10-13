import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/asma_allah/asma_allah_cubit.dart';

class AsmaAllahScreen extends StatelessWidget {
  const AsmaAllahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Padding(
        padding: EdgeInsets.all(15),
        child: BuidlBody(context),
      ),
    );
  }

  BuidlBody(BuildContext context) {
    return BlocBuilder<AsmaAllahCubit, AsmaAllahState>(
      builder: (context, state) {
        if (state is AsmaAllahLodingState) {
          return const CircularProgressIndicator.adaptive();
        }
        if (state is AsmaAllahDoneState) {
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    state.data[index].titel,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontFamily: "A Suls Regular",
                    ),
                  ),
                  Text(state.data[index].text),
                  const Divider(),
                ],
              );
            },
          );
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
