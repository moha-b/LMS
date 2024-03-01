import 'package:flutter/material.dart';
import 'package:lms/features/Login/view/widgets/form_view.dart';
import 'package:lms/features/Login/view/widgets/welcome_view.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          WelcomeView(),
          FormView(),
        ],
      ),
    );
  }

}
