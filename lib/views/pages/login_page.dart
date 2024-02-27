import 'package:ebhc/data_models/firebase_firestore_user_profile_stream_provider.dart';
import 'package:ebhc/data_models/login/login_share_preference.dart';
import 'package:ebhc/data_models/share_pref_provider.dart';
import 'package:ebhc/main.dart';
import 'package:ebhc/provider/login_provider.dart';
import 'package:ebhc/views/pages/forget_pw_page.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  String? email;
  String? password;
  bool isSignIn = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.focused,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }

    if (states.contains(MaterialState.selected)) {
      return Colors.white;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final errorMsg = ref.watch(errorMessageProvider);
    final loginData = ref.watch(loginStateNotifierProvider);

    if (email == null) {
      email = loginData.email;
      emailController.text = email ?? '';
    }
    if (password == null) {
      password = loginData.password;
      passwordController.text = password ?? '';
    }

    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      isSignIn = loginData.isSignIn;
    }
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBarWidget(
        appBar: AppBar(),
        isLeading: false,
        icon: false,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 8,
              ),
              Container(
                height: height / 7,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/eb_logo_set_0726-10 1.png"))),
              ),
              SizedBox(
                height: height / 35,
              ),
              const Align(
                alignment: Alignment.center,
                child: AppText(
                  text: "Smart construction \n アカウントでサインイン",
                  weight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "メールアドレス",
                    size: 12.0,
                    color: AppColors.labelColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.labelColor,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.labelColor,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.labelColor,
                          ),
                        ),
                        hintText: "xxxxxx@gmail.com",
                        hintStyle: TextStyle(
                            color:
                                AppColors.darklightNeutral50.withOpacity(0.4),
                            fontFamily: "Noto Sans JP"),
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 1),
                      ),
                      style: const TextStyle(
                        color: AppColors.labelColor,
                        fontFamily: "Noto Sans JP",
                      ),
                      onChanged: (String value) {
                        email = value;
                        if (value.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          ref
                              .read(loginStateNotifierProvider.notifier)
                              .toggleSignIn(true);
                        } else {
                          ref
                              .read(loginStateNotifierProvider.notifier)
                              .toggleSignIn(false);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "パスワード",
                    size: 12.0,
                    color: AppColors.labelColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      obscureText: loginData.obscureText,
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: () {
                              ref
                                  .read(loginStateNotifierProvider.notifier)
                                  .toggleObscure(!loginData.obscureText);
                            },
                            icon: loginData.obscureText
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : const Icon(Icons.visibility_off,
                                    color: Colors.white)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.labelColor,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.labelColor,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.labelColor,
                          ),
                        ),
                        hintText: "パスワードを入力",
                        hintStyle: TextStyle(
                            color:
                                AppColors.darklightNeutral50.withOpacity(0.4),
                            fontFamily: "Noto Sans JP"),
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 1),
                      ),
                      style: const TextStyle(
                        color: AppColors.labelColor,
                        fontFamily: "Noto Sans JP",
                      ),
                      onChanged: (String value) {
                        password = value;
                        if (password!.isNotEmpty &&
                            emailController.text.isNotEmpty) {
                          ref
                              .read(loginStateNotifierProvider.notifier)
                              .toggleSignIn(true);
                        } else {
                          ref
                              .read(loginStateNotifierProvider.notifier)
                              .toggleSignIn(false);
                        }
                      },
                    ),
                  ),
                ],
              ),
              errorMsg == ""
                  ? const SizedBox()
                  : AppText(
                      text: errorMsg,
                      color: AppColors.pinkColor,
                      size: 12,
                    ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: ColoredBox(
                        color: Colors.white,
                        child: Checkbox(
                          value: loginData.checkboxValue,
                          onChanged: (value) {
                            ref.read(loginStateNotifierProvider.notifier)
                                .toggleCheckbox(value!);
                          },
                          activeColor: Colors.white,
                          focusColor: Colors.white,
                          checkColor: Colors.black,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const AppText(
                      text: "ログインを保持する",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: loginData.isSignIn
                      ? () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((user) async {
                            if (loginData.checkboxValue) {
                              ref
                                  .read(loginStateNotifierProvider.notifier)
                                  .emailAndPassword(emailController.text,
                                      passwordController.text);
                            } else {
                              // dispose login data provider
                              ref.invalidate(loginStateNotifierProvider);
                            }

                            emailController.clear();
                            passwordController.clear();
                            ref.read(errorMessageProvider.state).state = "";
                            requestLocationPermission();
                            /// ####################################################
                            await ref.read(makeFirstLaunchProvider);
                            await ref.refresh(isFirstLaunchProvider);
                            Routemaster.of(context).replace("/");
                          }).catchError((e) {
                            ref.read(errorMessageProvider.notifier).state =
                                "メールアドレス と パスワード are not match!";
                          });
                        }
                      : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: loginData.isSignIn
                        ? AppColors.bgBtnColor
                        : AppColors.bgBtnDisableColor,
                    side: BorderSide(
                        width: 1, // the thickness
                        color: loginData.isSignIn
                            ? AppColors.btnBorderColor
                            : AppColors
                                .darkBackground // the color of the border
                        ),
                  ),
                  child: const AppText(
                    text: "サインイン",
                    size: 15.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    emailController.clear();
                    passwordController.clear();
                    ref.invalidate(errorMessageProvider);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ForgetPasswordPage();
                    }));
                  },
                  child: const AppText(
                    text: "パスワードをお忘れの方",
                    size: 15.0,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              // const Divider(
              //   height: 40,
              //   thickness: 2,
              //   color: Color(0xFF51545D),
              //   indent: 45,
              //   endIndent: 45,
              // ),
              // const AppText(
              //   text: "Smart Constructionアカウントをお持ちでない方",
              //   size: 14,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
