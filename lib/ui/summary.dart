part of cupcake.ui;

class SummaryView extends ViewModelWidget<CupcakeViewModel> {
  const SummaryView({Key? key}) : super(key: key);
  static const String route = '/summary';

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'Detalles de asesorias'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            SummaryItem(
              title: 'MATERIA',
              value: '${viewModel.materia}',
            ),
            SummaryItem(
              title: 'UNIDAD TEMATICA',
              value: viewModel.flavor,
            ),
            SummaryItem(
              title: 'FECHA',
              value: viewModel.date,
            ),
            SummaryItem(
              title: 'HORA',
              value: viewModel.timeasesoria11,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary)
              ),
              onPressed: () async {
                ScaffoldMessengerState messenger =
                ScaffoldMessenger.of(context);
                viewModel.sendOrder().then((value) {
                  print(value);
                  viewModel.cancel(context);
                  const snackbar = SnackBar(
                      content: Text(
                          "Se envio correctamente el email al usuario. "),
                      duration: Duration(seconds: 9),
                      backgroundColor: Colors.lightGreen);
                  messenger.showSnackBar(snackbar);
                  });
              },
              child: const Text('Enviar detalles por email. ', style: TextStyle(color: Colors.black))
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => viewModel.cancel(context),
              child: const Text('Cancelar'),
            )
          ],
        ),
      ),
    );
  }
}
