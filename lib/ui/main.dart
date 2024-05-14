import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_rxdart/model/Meals.dart';
import 'package:mvvm_rxdart/ui/component/meal_by_character.dart';
import 'package:mvvm_rxdart/ui/login.dart';

import '../viewmodel/food_mvvm.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FoodViewModel foodViewModel = FoodViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodViewModel.getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //foodViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<ResponseData>(
                  stream: foodViewModel.foodStream,
                  builder: (context, snapshot) {
                    return CachedNetworkImage(
                        imageUrl: snapshot.data != null
                            ? snapshot.data!.meals![0].strMealThumb.toString()
                            : 'https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1');
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      foodViewModel.getData2();
                    },
                    child: const Text('click me')),
                const SizedBox(height: 20,),
                MealByCharacter(foodViewModel: foodViewModel,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
