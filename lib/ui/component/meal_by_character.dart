import 'package:flutter/material.dart';
import 'package:mvvm_rxdart/Utils/utils.dart';
import 'package:mvvm_rxdart/ui/component/meal_by_character_page.dart';
import 'package:mvvm_rxdart/viewmodel/food_mvvm.dart';

class MealByCharacter extends StatefulWidget {
  const MealByCharacter({super.key, required this.foodViewModel});

  final FoodViewModel foodViewModel;

  @override
  State<MealByCharacter> createState() => _MealByCharacterState();
}

class _MealByCharacterState extends State<MealByCharacter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                widget.foodViewModel.getDataByCharacter(
                    UtilsSingleton.buildAlphabetList()[index]);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MealByCharacterPage(
                        foodViewModel: widget.foodViewModel);
                  },
                ));
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              child: Text(UtilsSingleton.buildAlphabetList()[index],
                  style: const TextStyle(color: Colors.white)),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: UtilsSingleton.buildAlphabetList().length),
    );
  }
}
