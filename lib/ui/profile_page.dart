part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  List<String> accountMenuList = [
    'Edit Profile',
    'Home Address',
    'Security',
    'Payments',
  ];

  List<String> foodMarketMenuList = [
    'Rate App',
    'Help Center',
    'Privacy & Policy',
    'Term & Conditions',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 85),
            child: Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.only(bottom: 7),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/474x/06/50/3f/06503f6ffc43497e4012919186afbf4a.jpg'),
                ),
              ),
            ),
          ),
          Text(
            'Vechoyys',
            style: blackFontStyle1.copyWith(fontSize: 24),
          ),
          Text(
            'kahveci@gmail.com',
            style: greyFontStyle.copyWith(fontSize: 20),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTabbar(
              selectedIndex: selectedIndex,
              titles: ['Account', 'FoodMarket'],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: (selectedIndex == 0
                    ? accountMenuList
                    : foodMarketMenuList)
                .map((e) => Padding(
                      padding: const EdgeInsets.only(
                        right: defaultMargin,
                        left: defaultMargin,
                        bottom: 16,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e,
                                style: blackFontStyle3,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: greyColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserCubit>().signOut();
              Get.to(SignInPage());
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
