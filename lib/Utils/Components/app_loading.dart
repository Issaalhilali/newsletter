import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: const [
            CupertinoActivityIndicator(
              radius: 18,
            ),
          ],
        ),
      ),
    );
  }
}
