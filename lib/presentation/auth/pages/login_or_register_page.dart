import 'package:fitnesspal_user/presentation/auth/providers/auth_provider.dart';
import 'package:fitnesspal_user/presentation/auth/widgets/login_or_register_view.dart';
import 'package:fitnesspal_user/utils/managers/asset_manager.dart';
import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:fitnesspal_user/utils/managers/style_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:fitnesspal_user/utils/router/router.dart';
import 'package:fitnesspal_user/utils/widgets/lime_green_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


enum AuthMode {signUp, signIn }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  AuthMode _authMode = AuthMode.signIn;
  // ignore: avoid_init_to_null
  var dropDownGenderValue = null;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _repeatPasswordController.dispose();

    super.dispose();
  }

  bool get isEmailNotEmpty => _emailController.text.isNotEmpty;
  bool get isPasswordConfirmed => _passwordController == _repeatPasswordController;
  bool get isRegisterView => _authMode == AuthMode.signUp;
  bool get isLoginView => _authMode == AuthMode.signIn;

  void _switchAuthMode() {
    if (isLoginView) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
    } else if (isRegisterView) {
      setState(() {
        _authMode = AuthMode.signIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    Future<void> signUserIn() async {
      try {
        await authProvider.signIn(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
      } catch (e) {
        rethrow;
      }
    }

    Future<void> signUserUp() async {
      try {
        await authProvider.register(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
      } catch (e) {
        rethrow;
      }
    }

    void onPressed() {
      if(_emailController.text.isEmpty){
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Your email address is empty!",
          ),
        );
      }else if(_passwordController.text.isEmpty){
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Your password is empty!",
          ),
        );
      }else{
        if (isLoginView) {
          signUserIn();
        } else if (isRegisterView) {
          signUserUp();
        }
      }
    }

    return Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
        return Scaffold(
          backgroundColor: ColorManager.darkGrey,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: PaddingManager.p12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: PaddingManager.p8),
                      child: SizedBox(
                        width: SizeManager.s150.w,
                        height: SizeManager.s150.h,
                        child: Image.asset(
                          ImageManager.logo,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: PaddingManager.p8),
                      child: Text(
                        StringsManager.fitnessioABtitle,
                        style: StyleManager.appbarTitleTextStyle,
                      ),
                    ),
                    SizedBox(height: SizeManager.s100.h),
                    LoginOrRegisterView(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      isRegisterView: isRegisterView,
                      repeatPasswordController: _repeatPasswordController,
                    ),
                    isLoginView
                        ? Padding(
                            padding: const EdgeInsets.only(
                              right: PaddingManager.p28,
                              left: PaddingManager.p28,
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.forgotPasswordRoute);
                                },
                                child: Text(
                                  StringsManager.forgotPassword,
                                  style: StyleManager.loginPageSubTextTextStyle,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: PaddingManager.p2),
                      child: LimeGreenRoundedButtonWidget(
                        onTap: onPressed,
                        title: isLoginView
                            ? StringsManager.signIn
                            : StringsManager.signUp,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: PaddingManager.p28,
                        right: PaddingManager.p28,
                        top: PaddingManager.p18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLoginView
                                ? StringsManager.dontHaveAcc
                                : StringsManager.haveAcc,
                            style: StyleManager.loginPageSubTextTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: PaddingManager.p8),
                            child: GestureDetector(
                              onTap: _switchAuthMode,
                              child: Text(
                                isLoginView
                                    ? StringsManager.signUp
                                    : StringsManager.signIn,
                                style:
                                    StyleManager.loginPageSubButtonSmallTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animate().fadeIn(duration: 500.ms),
              ),
            ),
          ),
        );
      }
    );
  }
}
