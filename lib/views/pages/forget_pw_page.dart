import 'package:ebhc/data_models/firebase_firestore_user_profile_stream_provider.dart';

import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class ForgetPasswordPage extends HookConsumerWidget {
  ForgetPasswordPage({super.key});
  bool isSignIn = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isSuccess = ref.watch(isSuccessProvider);
    String isSuccessMsg = ref.watch(isSuccessMsgProvider);
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: height / 8,
                // color: Colors.red,
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
              const AppText(
                text: "Smart construction \n アカウントでサインイン",
                weight: FontWeight.w600,
              ),
              const SizedBox(
                height: 20,
              ),
              isSuccess
                  ? const SizedBox()
                  : Column(
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
                                  color: AppColors.darklightNeutral50
                                      .withOpacity(0.4),
                                  fontFamily: "Noto Sans JP"),
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 1),
                            ),
                            style: const TextStyle(
                              color: AppColors.labelColor,
                              fontFamily: "Noto Sans JP",
                            ),
                            onChanged: (String value) {
                              debugPrint(value);
                              if (value.isNotEmpty) {
                                isSignIn = true;
                              } else {
                                isSignIn = false;
                              }
                            },
                          ),
                        ),
                        AppText(
                          text: ref.watch(errorMessageProvider),
                          color: AppColors.pinkColor,
                          size: 12,
                        ),
                      ],
                    ),
              SizedBox(
                height: isSuccess ? 0 : 15,
              ),
              isSuccess == true
                  ? const SizedBox()
                  : SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: isSignIn
                            ? () {
                                FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                        email: emailController.text.trim())
                                    .then((user) {
                                  ref.read(errorMessageProvider.state).state =
                                      "";
                                  ref.read(isSuccessProvider.state).state =
                                      true;
                                  ref.read(isSuccessMsgProvider.state).state =
                                      "We've sent you an email with a link to reset your password. Please check your emails.";
                                }).catchError((e) {
                                  ref.read(isSuccessProvider.state).state =
                                      false;
                                  ref.read(isSuccessMsgProvider.state).state =
                                      "";
                                  ref.read(errorMessageProvider.state).state =
                                      e.message.toString();
                                });
                              }
                            : () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSignIn
                              ? AppColors.bgBtnColor
                              : AppColors.bgBtnDisableColor,
                          side: BorderSide(
                              width: 1, // the thickness
                              color: isSignIn
                                  ? AppColors.btnBorderColor
                                  : AppColors
                                      .darkBackground // the color of the border
                              ),
                        ),
                        child: const AppText(
                          text: "パスワードを再設定する",
                          size: 15.0,
                        ),
                      ),
                    ),
              isSuccessMsg == ""
                  ? const SizedBox()
                  : AppText(
                      text: isSuccessMsg,
                      size: 16,
                      textAlign: TextAlign.left,
                    ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  ref.invalidate(isSuccessMsgProvider);
                  ref.invalidate(isSuccessProvider);
                  ref.invalidate(errorMessageProvider);
                  Routemaster.of(context).pop();
                },
                child: const Center(
                  child: AppText(
                    text: "Go Back",
                    size: 14,
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
            ]),
          )),
    );
  }
}

// Provide your email and we will send you a link to reset your password.
