part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'Savor a meal worthy of you',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //   Header
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Item Orders',
                  style: blackFontStyle3.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.transaction.food!.picturePath!),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(
                            widget.transaction.food!.name!,
                            style: blackFontStyle2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            symbol: 'IDR ',
                            decimalDigits: 0,
                            locale: 'id_ID',
                          ).format(widget.transaction.food!.price),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} item(s)',
                        style: greyFontStyle.copyWith(fontSize: 13),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                //  Detail Transaction
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Detail Transaction',
                  style: blackFontStyle3.copyWith(fontSize: 16),
                ),
                // Makanam
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      widget.transaction.food!.name!,
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction.food!.price),
                    )
                  ],
                ),
                // Quantity
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      '${widget.transaction.quantity.toString()} item(s)',
                    ),
                  ],
                ),
                // Sub Total
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Sub Total',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction.food!.price! *
                          widget.transaction.quantity!),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // Tax
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(widget.transaction.food!.price! *
                          widget.transaction.quantity! *
                          0.1),
                    ),
                  ],
                ),
                // Driver / Shipping Cost
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Shipping Cost',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(50000),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // Total
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(
                        widget.transaction.total! +
                            (widget.transaction.food!.price! *
                                    widget.transaction.quantity! *
                                    0.1)
                                .toInt() +
                            50000,
                      ),
                    )
                  ],
                ),
                SizedBox(height: defaultMargin),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Deliver to:',
                  style: blackFontStyle3,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Nama Penerima:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      mockUser.name!,
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Email Penerima:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      mockUser.email!,
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Phone Number:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      mockUser.phoneNumber!,
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Address:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      mockUser.address!,
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'House Number:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      mockUser.houseNumber!,
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'City:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      mockUser.city!,
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  margin: EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      var paymentURL = await context
                          .read<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                            dateTime: DateTime.now(),
                            total: widget.transaction.total! +
                                (widget.transaction.food!.price! *
                                        widget.transaction.quantity! *
                                        0.1)
                                    .toInt() +
                                50000,
                          ));
                      if (paymentURL != null) {
                        Get.to(PaymentMethodPage(paymentURL: paymentURL));
                      } else {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Transaction Failed",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          messageText: Text(
                            "Please try again later",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Order Now',
                      style: blackFontStyle3.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
