import 'package:fitnesspal_user/presentation/consumption/providers/consumption_provider.dart';
import 'package:fitnesspal_user/presentation/consumption/widgets/quick_water_add_button.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:fitnesspal_user/utils/widgets/lime_green_rounded_button.dart';
import 'package:fitnesspal_user/utils/widgets/text_field_underlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  final TextEditingController _drinkController = TextEditingController();
  late ConsumptionProvider consumptionProvider;
  @override
  void dispose() {
    _drinkController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    consumptionProvider = Provider.of<ConsumptionProvider>(context, listen: false);
  }

  addCustomWater() {
    try {
      consumptionProvider.addWater(
        amount: double.parse(_drinkController.text),
        dateTime: DateTime.now(),
      ).then((value) => showTopSnackBar(
          Overlay.of(context), const CustomSnackBar.success(message: "Water Consumption Added Successfully",)
      ));
    } catch (e) {
      rethrow;
    }
  }

  addFixedWater({required double amount}) {
    try {
      consumptionProvider.addWater(
        amount: amount,
        dateTime: DateTime.now(),
      ).then((value) => showTopSnackBar(
          Overlay.of(context), const CustomSnackBar.success(message: "Water Consumption Added Successfully",)
      ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.drinkPageHeadLine,
          style: StyleManager.abTitleTextStyle,
        ),
        elevation: 0.0,
        backgroundColor: ColorManager.darkGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: PaddingManager.p12),
          child: Container(
            height: SizeManager.s40.h,
            width: SizeManager.s40.w,
            decoration: BoxDecoration(
              color: ColorManager.grey3,
              borderRadius: BorderRadius.circular(
                RadiusManager.r40.r,
              ),
            ),
            child: IconButton(
              splashColor: ColorManager.grey3,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: SizeManager.s26,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: SizeManager.s300.h,
                  child: Lottie.asset(
                    AnimationManager.water,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                    bottom: PaddingManager.p12,
                  ),
                  child: Text(
                    StringsManager.quickAdd,
                    style: StyleManager.drinkPageSpacerTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p12,
                  right: PaddingManager.p12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    QuickWaterAddButton(
                      label: StringsManager.l02,
                      addWater: () {
                        addFixedWater(amount: 0.2);
                      },
                    ),
                    QuickWaterAddButton(
                      label: StringsManager.l05,
                      addWater: () {
                        addFixedWater(amount: 0.5);
                      },
                    ),
                    QuickWaterAddButton(
                      label: StringsManager.l1,
                      addWater: () {
                        addFixedWater(amount: 1.0);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                    bottom: PaddingManager.p12,
                    top: PaddingManager.p28,
                  ),
                  child: Text(
                    StringsManager.customAdd,
                    style: StyleManager.drinkPageSpacerTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p28,
                  right: PaddingManager.p28,
                  top: PaddingManager.p12,
                  bottom: PaddingManager.p12,
                ),
                child: TextFieldWidgetUnderLined(
                  controller: _drinkController,
                  labelHint: StringsManager.waterHint,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
              ),
              LimeGreenRoundedButtonWidget(
                onTap: addCustomWater,
                title: StringsManager.add,
              )
            ],
          ),
        ),
      ),
    );
  }
}
