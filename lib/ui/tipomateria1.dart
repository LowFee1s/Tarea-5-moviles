part of cupcake.ui;

class TipoMateriaView1 extends ViewModelWidget<CupcakeViewModel> {
  const TipoMateriaView1({Key? key}) : super(key: key);
  static const String route = '/tipomateriafisica';

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'Tipo materia'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ...viewModel.MateriasFisica.mapIndexed(
            (int idx, String flavor) => ListTile(
              leading: Radio(
                value: idx,
                groupValue: viewModel.flavorIdx,
                onChanged: viewModel.setFlavorIdx,
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(viewModel.MateriasFisica[idx]),
              onTap: () { viewModel.setFlavorIdx(idx); viewModel.setMateria(flavor); },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Divider(thickness: 4),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                NavigationButtons(
                  onNext: viewModel.flavorIdx != null
                      ? () => Navigator.of(context).pushNamed(DateView.route)
                      : null,
                  onCancel: () => viewModel.cancel(context),
                  viewModel: viewModel.flavorIdx,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
