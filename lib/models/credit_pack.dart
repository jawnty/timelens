class CreditPack {
  final String productId;
  final int credits;
  final String price;
  final String title;

  const CreditPack({
    required this.productId,
    required this.credits,
    required this.price,
    required this.title,
  });
}

const List<CreditPack> creditPacks = [
  CreditPack(
    productId: 'timelens_credits_10',
    credits: 10,
    price: '\$1.99',
    title: '10 Credits',
  ),
  CreditPack(
    productId: 'timelens_credits_25',
    credits: 25,
    price: '\$3.99',
    title: '25 Credits',
  ),
  CreditPack(
    productId: 'timelens_credits_50',
    credits: 50,
    price: '\$5.99',
    title: '50 Credits',
  ),
  CreditPack(
    productId: 'timelens_credits_100',
    credits: 100,
    price: '\$9.99',
    title: '100 Credits',
  ),
];
