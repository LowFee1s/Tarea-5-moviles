part of cupcake.ui;

class QuantityView extends ViewModelWidget<CupcakeViewModel> {
  const QuantityView({Key? key}) : super(key: key);
  static const String route = '/quantity';

  void navigateToFlavor(BuildContext context) =>
      Navigator.of(context).pushNamed(FlavorView.route);

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'Cupcake'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                'assets/cupcake.svg',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 34),
              const Text(
                'Order Cupcakes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF7D7D7D),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  viewModel.setQuantity(1);
                  navigateToFlavor(context);
                },
                child: const Text('ONE CUPCAKE'),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.setQuantity(6);
                  navigateToFlavor(context);
                },
                child: const Text('SIX CUPCAKES'),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.setQuantity(12);
                  navigateToFlavor(context);
                },
                child: const Text('TWELVE CUPCAKES'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
