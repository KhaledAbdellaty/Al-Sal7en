import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/azkar/presentaion/cubit/azkar_cubit.dart';
import 'package:untitled/features/azkar/presentaion/screen/azkar_screen.dart';

import '../../domain/entity/azkar_category.dart';

class AzkarCategoryScreen extends StatelessWidget {
  const AzkarCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocBuilder<AzkarCubit,AzkarState>(builder:(context, state) {
        if(state is AzkarLoadingState){
       return   CircularProgressIndicator.adaptive();
        }else if (state is AzkarSucssecState){
    
          return screenCtegory(state.azkarData);
        }else {
          return Text("Un Expected Error");
        }
        
      }),
    );
  }


  screenCtegory(List<AzkarCategory> azkar ){
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(

              itemCount: azkar.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AzkarScreen(azkar: azkar[index].text)));
                      },
                      child: Text(azkar[index].title)),
                      SizedBox(height: 30,),
                    

                    
                  ],
                );
              
              
            }),
          )
        ],
      ),
    );
  }
}