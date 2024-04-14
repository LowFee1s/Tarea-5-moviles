part of cupcake.ui;

class SummaryView extends ViewModelWidget<CupcakeViewModel> {
  const SummaryView({Key? key}) : super(key: key);
  static const String route = '/summary';

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'Order Summary'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            SummaryItem(
              title: 'quantity',
              value: '${viewModel.quantity}',
            ),
            SummaryItem(
              title: 'flavor',
              value: viewModel.flavor,
            ),
            SummaryItem(
              title: 'pickup date',
              value: viewModel.date,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'TOTAL ${viewModel.formattedSubtotal}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                ScaffoldMessengerState messenger =
                    ScaffoldMessenger.of(context);
                bool couldSendOrder = await viewModel.sendOrder();
                if (!couldSendOrder) {
                  const snackbar = SnackBar(
                    content: Text(
                      'Could not send order: you don\'t have an available mail app to send the order.',
                    ),
                  );
                  messenger.showSnackBar(snackbar);
                }
              },
              child: const Text('SEND ORDER TO ANOTHER APP'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => viewModel.cancel(context),
              child: const Text('CANCEL'),
            )
          ],
        ),
      ),
    );
  }
}
