part of 'widgets.dart';

class FullDescription extends StatelessWidget {
  FullDescription({Key, key, required this.description});

  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Full Description',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Text(description),
        ),
      ),
    );
  }
}
