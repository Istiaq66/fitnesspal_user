import 'package:fitnesspal_user/presentation/consumption/providers/consumption_provider.dart';
import 'package:fitnesspal_user/presentation/consumption/widgets/new_meal_app_bar.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:fitnesspal_user/utils/widgets/lime_green_rounded_button.dart';
import 'package:fitnesspal_user/utils/widgets/small_text_field_widget.dart';
import 'package:fitnesspal_user/utils/widgets/text_field_underlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class NewMealPage extends StatefulWidget {
  const NewMealPage({super.key});

  @override
  State<NewMealPage> createState() => _NewMealPageState();
}

class _NewMealPageState extends State<NewMealPage> {
  final TextEditingController _mealTitleController = TextEditingController();
  final TextEditingController _mealCalloriesController =
      TextEditingController();
  final TextEditingController _mealAmountController = TextEditingController();
  final TextEditingController _mealFatsController = TextEditingController();
  final TextEditingController _mealCarbsController = TextEditingController();
  final TextEditingController _mealProteinsController = TextEditingController();
  double valueFats = 0.0;
  double valueCarbs = 0.0;
  double valueProtein = 0.0;

  @override
  void dispose() {
    _mealTitleController.dispose();
    _mealCalloriesController.dispose();
    _mealAmountController.dispose();
    _mealCarbsController.dispose();
    _mealFatsController.dispose();
    _mealProteinsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final consumptionProvider =
        Provider.of<ConsumptionProvider>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          deviceWidth,
          SizeManager.s60.h,
        ),
        child: const NewMealPageAppBar(),
      ),
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: PaddingManager.p8),
                child: SizedBox(
                  width: SizeManager.s250.w,
                  height: SizeManager.s250.h,
                  child: Image.asset(
                    ImageManager.fork,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _mealTitleController,
                  labelHint: StringsManager.mealNameHint,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  top: PaddingManager.p12,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _mealAmountController,
                  labelHint: StringsManager.mealAmountHint,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  top: PaddingManager.p56,
                  bottom: PaddingManager.p12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallTextFieldWidget(
                      controller: _mealCalloriesController,
                      labelHint: StringsManager.mealCaloriesHint,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SmallTextFieldWidget(
                      controller: _mealFatsController,
                      labelHint: StringsManager.mealFatsHint,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  bottom: PaddingManager.p28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallTextFieldWidget(
                      controller: _mealCarbsController,
                      labelHint: StringsManager.mealCarbsHint,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                    SmallTextFieldWidget(
                      controller: _mealProteinsController,
                      labelHint: StringsManager.mealProteinsHint,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                  ],
                ),
              ),
              LimeGreenRoundedButtonWidget(
                onTap: () {
                 String mealTitle = _mealTitleController.text;
                 double amount = double.parse(_mealAmountController.text);
                 double calories = double.parse(_mealCalloriesController.text);
                 double fat = double.parse(_mealFatsController.text);
                 double carbs = double.parse(_mealCarbsController.text);
                 double protein = double.parse(_mealProteinsController.text);

                 if(amount < fat){
                   showTopSnackBar(Overlay.of(context), const CustomSnackBar.error( message: "Fat can't be greater than amount",),);
                 }else if(amount < carbs){
                   showTopSnackBar(Overlay.of(context), const CustomSnackBar.error( message: "Carbs can't be greater than amount",),);
                 }else if(amount < protein){
                   showTopSnackBar(Overlay.of(context), const CustomSnackBar.error( message: "Protein can't be greater than amount",),);
                 }else{
                   try {
                     consumptionProvider.addNewMeal(
                       title: mealTitle,
                       amount: amount,
                       calories: calories,
                       fats: fat,
                       carbs: carbs,
                       proteins: protein,
                       dateTime: DateTime.now(),
                     );
                     Navigator.of(context).pop();
                   } catch (e) {
                     rethrow;
                   }
                 }
                },
                title: StringsManager.add,
              )
            ],
          ),
        ),
      ),
    );
  }
}
