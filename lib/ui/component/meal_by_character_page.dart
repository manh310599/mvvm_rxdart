import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_rxdart/model/Meals.dart';
import 'package:mvvm_rxdart/viewmodel/food_mvvm.dart';

class MealByCharacterPage extends StatefulWidget {
  const MealByCharacterPage({super.key, required this.foodViewModel});

  final FoodViewModel foodViewModel;

  @override
  State<MealByCharacterPage> createState() => _MealByCharacterPageState();
}

class _MealByCharacterPageState extends State<MealByCharacterPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResponseData>(
        stream: widget.foodViewModel.foodByCharacter,
        builder: (context, snapshot) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: snapshot.data?.meals?.isEmpty == false
                      ? snapshot.data!.meals![index].strMealThumb.toString()
                      : 'https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1',
                  placeholder: (context, url) =>  Image.network('https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1'),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: snapshot.data?.meals?.length ?? 0);
        });
  }
}
