import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_rxdart/model/Meals.dart';
import 'package:mvvm_rxdart/ui/login.dart';

import '../viewmodel/food_mvvm.dart';

void main() {
  runApp(const MaterialApp(
    home: Login(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeSite(),
    );
  }
}

class HomeSite extends StatefulWidget {
  const HomeSite({super.key});

  @override
  State<HomeSite> createState() => _HomeSiteState();
}

class _HomeSiteState extends State<HomeSite> {
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
        child: Column(
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
                child: const Text('click me'))
          ],
        ),
      ),
    );
  }
}
