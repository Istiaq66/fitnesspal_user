import 'package:fitnesspal_user/presentation/auth/providers/auth_provider.dart';
import 'package:fitnesspal_user/presentation/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_data_page.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          final user = authProvider.user;
          final hasAgeParameter = authProvider.hasAgeParameter;
          var isRegisteredUser = user != null && hasAgeParameter == true;
          var isAddDataMode = user != null && hasAgeParameter == false;
          if (isRegisteredUser) {
            return const MainPage();
          } else if (isAddDataMode) {
            return const AddDataPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
