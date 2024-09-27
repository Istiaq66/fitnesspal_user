
import 'package:fitnesspal_user/common/widgets/get_height_weight.dart';
import 'package:flutter/material.dart';
class articlealmonds extends StatefulWidget {
  const articlealmonds({Key? key}) : super(key: key);

  @override
  State<articlealmonds> createState() => _articlealmondsState();
}

class _articlealmondsState extends State<articlealmonds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        height: 53.0,
        color: Colors.black26,
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(left: getWidth(context)*0.05),
              alignment: Alignment.centerLeft,
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                color: Colors.red,
                size: 27.0,
              ),

            ),
            const Spacer(),
            IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerLeft,
              onPressed: (){},
              icon: const Icon(
                Icons.share,
                color: Colors.red,
                size: 27.0,
              ),

            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: getWidth(context)*0.05,left: getWidth(context)*0.04,right: getWidth(context)*0.04),

              height: getHeight(context)*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    image: AssetImage ("assets/images/almonds.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: getWidth(context)*0.05),
              alignment: Alignment.centerLeft,
              width: getWidth(context)*0.6,
              height: getWidth(context)*0.22,
              child: const Text(
                'What is Special About Almonds?',
                style: TextStyle(
                  fontSize:
                  23.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              margin: EdgeInsets.only(left: getWidth(context)*0.052),
              width: getWidth(context)*0.2,
              height: getWidth(context)*0.06,
              child: const Center(
                child: Text(
                  'Nutrition',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 2,left: getWidth(context)*0.052,right: getWidth(context)*0.052 ),
              width: getWidth(context),
              height: 1.5,
              color: Colors.white,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 9.0,
            ),
            Container(
              margin: EdgeInsets.only(left: getWidth(context)*0.052,right: getWidth(context)*0.052 ),
              width: getWidth(context),
              height: getWidth(context)*0.05,
              child: const Text(
                '1 min read',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(
              height: 9.0,
            ),
            Container(
              margin: EdgeInsets.only(left: getWidth(context)*0.052,right: getWidth(context)*0.052 ),
              width: getWidth(context),
              height: 1.5,
              color: Colors.white,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(left: getWidth(context)*0.05,right: getWidth(context)*0.05,top: 10.0),
              child: const Text(
                'Almonds are high in antioxidants, vitamin E, protein, and fiber. This nutrient-rich nut is an excellent addition to any diet since it is a versatile ingredient linked to several health benefits. ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),

            const SizedBox(
              height: 8.0,
            ),

            Container(
              margin: EdgeInsets.only(left: getWidth(context)*0.05,right: getWidth(context)*0.05,top: 10.0),
              child: const Text(
                'Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree. They are native to the Middle East, but the United States is now the world’s largest producer.The almonds you can buy in stores usually have the shell removed, revealing the edible nut inside. They are sold either raw or roasted.They are also used to produce products like almond milk, oil, butter, flour, paste, or marzipan.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),

            Container(
              margin: EdgeInsets.only(left: getWidth(context)*0.05,right: getWidth(context)*0.05,top: 10.0,bottom: 20.0),
              child: const Text(
                'Almonds are also high in phytic acid, a substance that binds certain minerals and prevents them from being absorbed by the body. While phytic acid is generally considered a healthy antioxidant, it also slightly reduces the amount of iron, zinc, and calcium your body absorbs from almonds.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
