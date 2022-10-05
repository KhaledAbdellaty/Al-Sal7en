import 'package:flutter/material.dart';
import 'package:untitled/features/azkar/domain/entity/azkar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key,required this.azkar});
  final List<Azkar> azkar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      shrinkWrap: true,
      itemCount: azkar.length,
      itemBuilder: (context, index) {

      return Container(
        // height: 100,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(azkar[index].arabicText ,textDirection: TextDirection.rtl,)),
            
                CircleAvatar(child:Text("${azkar[index].repeat}"),)
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      );
      
    }),);

    
  }
}