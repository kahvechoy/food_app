part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {super.key, required this.transaction, required this.itemWidth});

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(transaction.food?.picturePath ??
                  'https://ui-avatars.com/api/?name=${transaction.food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth! - 182, //(80 + 12 + 90)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Text(
                    transaction.quantity.toString() + ' item(s) ~ ',
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(transaction.total),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              convertDateTimeDisplay(transaction.dateTime!),
              style: greyFontStyle,
            ),
            (transaction.status == TransactionStatus.delivered)
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Delivered ',
                            style: blackFontStyle2.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Container(
                            child: Icon(
                              MdiIcons.checkCircle,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : (transaction.status == TransactionStatus.canceled)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Canceled ',
                                style: blackFontStyle2.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  MdiIcons.closeCircle,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : (transaction.status == TransactionStatus.pending)
                        ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.yellow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Pending ',
                                  style: blackFontStyle2.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    MdiIcons.clockOutline,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'On Delivery ',
                                    style: blackFontStyle3.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      MdiIcons.walk,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
          ],
        ),
      ],
    );
  }
}
