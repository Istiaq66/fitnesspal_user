import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesspal_user/presentation/settings/pages/user_id_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitnesspal_user/presentation/settings/widgets/button_settings.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:fitnesspal_user/utils/router/router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? user;
  String? userId;

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user!.uid; // Get the user ID
      // Optionally, you could fetch more user data from Firestore if needed
      // final snapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      // Handle user data as needed
      setState(() {}); // Trigger a rebuild
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p12,
                  bottom: PaddingManager.p12,
                  top: PaddingManager.p12,
                ),
                child: Text(
                  StringsManager.accountSpacer,
                  style: StyleManager.settingsPageSpacerTextStyle,
                ),
              ),
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changeEmailRoute),
              iconData: Icons.email_outlined,
              title: StringsManager.changeEmail,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changePasswordRoute),
              iconData: Icons.lock_open_sharp,
              title: StringsManager.changePassword,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.deleteAccRoute),
              iconData: Icons.delete_outlined,
              title: StringsManager.deleteAcc,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: PaddingManager.p12,
                  bottom: PaddingManager.p12,
                  top: PaddingManager.p12,
                ),
                child: Text(
                  StringsManager.generalSpacer,
                  style: StyleManager.settingsPageSpacerTextStyle,
                ),
              ),
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> UserIDScreen(userId: userId ?? '',) )),
              iconData: Icons.insert_drive_file_rounded,
              title: StringsManager.getUserId,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () {
                //TODO:
              },
              iconData: Icons.nightlight_outlined,
              title: StringsManager.theme,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () =>   Navigator.of(context).pushNamed(Routes.subscription),
              iconData: Icons.monetization_on,
              title: StringsManager.subscription,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () {
                //TODO:
              },
              iconData: Icons.library_books_outlined,
              title: StringsManager.termsOfService,
            ),
            SettingsPageButton(
              deviceWidth: deviceWidth,
              onTap: () {
                //TODO:
              },
              iconData: Icons.person_add_alt_1_outlined,
              title: StringsManager.inviteFriend,
            ),
            SizedBox(height: SizeManager.s18.h,)
          ],
        ).animate().fadeIn(
              duration: 500.ms,
            ),
      ),
    );
  }
}
