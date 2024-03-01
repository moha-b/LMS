import 'package:flutter/material.dart';
import 'package:lms/features/Login/view/widgets/form_view.dart';
import 'package:lms/features/Login/view/widgets/welcome_view.dart';

import '../../../core/caching/shared_helper.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // initSharedHelper();
    return const Scaffold(
      body: Stack(
        children: [
          WelcomeView(),
          FormView(),
        ],
      ),
    );
  }
  // void initSharedHelper() async {
  //   await SharedHelper.init();
  // }
}
