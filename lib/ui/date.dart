part of cupcake.ui;

class DateView extends ViewModelWidget<CupcakeViewModel> {
  const DateView({Key? key}) : super(key: key);
  static const String route = '/date';

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'Fecha'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          ...viewModel.dates.mapIndexed(
            (int idx, String flavor) => ListTile(
              leading: Radio(
                value: idx,
                groupValue: viewModel.dateIdx,
                onChanged: viewModel.setDateIdx,
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(viewModel.dates[idx]),
              onTap: () => viewModel.setDateIdx(idx),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Divider(thickness: 2),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                NavigationButtons(
                  onNext: viewModel.dateIdx != null
                      ? () => Navigator.of(context).pushNamed(TimeAsesoria.route)
                      : null,
                  onCancel: () => viewModel.cancel(context),
                  viewModel: viewModel.dateIdx,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
