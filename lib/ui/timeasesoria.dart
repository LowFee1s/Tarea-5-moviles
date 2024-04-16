part of cupcake.ui;

class TimeAsesoria extends ViewModelWidget<CupcakeViewModel> {
  const TimeAsesoria({Key? key}) : super(key: key);
  static const String route = '/timeasesoria';

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'Hora asesoria'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          ...viewModel.timeasesoria1.mapIndexed(
            (int idx, String flavor) => ListTile(
              leading: Radio(
                value: idx,
                groupValue: viewModel.timeasesoria,
                onChanged: viewModel.setTimeasesoriaIdx,
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(viewModel.timeasesoria1[idx]),
              onTap: () { viewModel.setTimeasesoriaIdx(idx); viewModel.setTimeAsesoria(flavor); },
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
                  onNext: viewModel.timeasesoria != null
                      ? () => Navigator.of(context).pushNamed(SummaryView.route)
                      : null,
                  onCancel: () => viewModel.cancel(context),
                  viewModel: viewModel.timeasesoria,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
