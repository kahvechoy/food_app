part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: "Other Foods are on the way",
      subtitle: "Just stay at home while we are \nprocessing your best food",
      picturePath: 'assets/bike.png',
      buttonTap1: () {
        Get.offAll(MainPage());
      },
      buttonTap2: () {
        Get.offAll(MainPage(initialPage: 1));
      },
      buttonTitle1: 'Order Other Food',
      buttonTitle2: 'View My Order',
    );
  }
}
