part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage(
      {super.key,
      required this.user,
      required this.password,
      required this.pictureFile});

  final User user;
  final String password;
  final File pictureFile;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  bool isLoading = false;
  List<String>? cities;
  String? selectedCity;

  @override
  void initState() {
    cities = ['Bandung', 'Jakarta', 'Surabaya', 'Batam'];
    selectedCity = cities![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Address',
      subtitle: "Make Sure It's Valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: <Widget>[
          // Text Address
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              26.0,
              defaultMargin,
              6,
            ),
            child: Text(
              'Address',
              style: blackFontStyle2,
            ),
          ),
          // Text Field
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Your Address',
                  hintStyle: greyFontStyle),
            ),
          ),
          // Phone Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              10.0,
              defaultMargin,
              6,
            ),
            child: Text(
              'Phone Number',
              style: blackFontStyle2,
            ),
          ),
          // Field Phone Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type Your Phone Number',
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // House Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              10.0,
              defaultMargin,
              6,
            ),
            child: Text(
              'House Number',
              style: blackFontStyle2,
            ),
          ),
          // Field House Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: TextField(
              controller: houseNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type Your House Number',
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // City Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              10.0,
              defaultMargin,
              6,
            ),
            child: Text(
              'City',
              style: blackFontStyle2,
            ),
          ),
          // Field House Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: DropdownButton(
              value: selectedCity,
              items: cities!
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(
                        e,
                      ),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(
              top: 24,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: (isLoading == true)
                ? loadingIndicator
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      // Membuat salinan user dengan data baru
                      User user = widget.user.copyWith(
                        address: addressController.text,
                        phoneNumber: phoneNumberController.text,
                        houseNumber: houseNumberController.text,
                        city: selectedCity,
                      );

                      setState(() {
                        isLoading = true;
                      });

                      // Simulasi penundaan (hanya untuk pengujian, bisa dihapus)
                      await Future.delayed(Duration(seconds: 2));

                      // Memanggil fungsi signUp
                      await context.read<UserCubit>().signUp(
                            user,
                            widget.password,
                            pictureFile: widget.pictureFile,
                          );

                      // Mendapatkan state setelah signUp
                      UserState state = context.read<UserCubit>().state;

                      // Memeriksa status
                      if (state is UserLoaded) {
                        // Jika berhasil, ambil data lain
                        context.read<FoodCubit>().getFoods();
                        context.read<TransactionCubit>().getTransactions();
                        Get.to(() => MainPage());
                      } else {
                        // Menampilkan pesan jika sign up gagal
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            'Sign In Failed',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          messageText: Text(
                            'Please Try Again Later',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }

                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Text(
                      'Create Account',
                      style: blackFontStyle3,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
