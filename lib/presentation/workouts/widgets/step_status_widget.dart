import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:flutter/material.dart';

class StepStatusWidget extends StatelessWidget {
  final Color color;
  final String mainTitle;
  final IconData iconData;
  final String number;
  final String unit;

  const StepStatusWidget({
    Key? key,
    this.color = Colors.blue,
    required this.mainTitle,
    required this.iconData,
    this.number = '-',
    this.unit = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, ColorManager.limeGreen], // Lime color
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            offset: const Offset(0, 2), // X and Y offset
            blurRadius: 5, // Spread of the shadow
            spreadRadius: 1, // Size of the shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 40,
                ),
                const SizedBox(width: 4.0),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: number.toString(),
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).primaryColor,overflow: TextOverflow.ellipsis
                        ),
                      ),
                      if (unit.isNotEmpty)
                        TextSpan(
                          text: ' $unit',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.red
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Text(
                mainTitle,  textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}