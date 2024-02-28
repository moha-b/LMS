part of 'widgets.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 50.h, 0, 32.h),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                text: "Morning, ",
                style: TextStyle(
                  color: AppColors.gray900,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: const [
                  TextSpan(
                    text: "Ahmed 🌞",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ]),
          ),
          SizedBox(height: 4.h),
          Text(
            "What do you want to learn today?",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.gray600,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
