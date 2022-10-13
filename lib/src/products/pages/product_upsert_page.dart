import 'package:crud_app/src/products/models/product_model.dart';
import 'package:crud_app/src/products/state/product_state.dart';
import 'package:crud_app/src/products/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductUpsertPage extends StatefulWidget {
  const ProductUpsertPage({Key? key}) : super(key: key);

  @override
  State<ProductUpsertPage> createState() => _ProductUpsertPageState();
}

class _ProductUpsertPageState extends State<ProductUpsertPage> {
  final _form = GlobalKey<FormState>(debugLabel: 'upsert');
  Map<String, dynamic> _formData = {};

  _onSubmit(context) async {
    final isValid = _form.currentState?.validate() ?? false;
    if (isValid) {
      _form.currentState!.save();
      // final product = ProductModel.fromMap(_formData);
      await context.read<ProductStore>().upsert(_formData);
      Navigator.of(context).pop();
    }
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ProductStore>();
      var product = ModalRoute.of(context)?.settings.arguments as ProductModel?;
      if (product != null) {
        final productId = product.id ?? "";
        provider.show(productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductStore>();
    final state = provider.value;

    Widget child = Container();
    Widget title = const Text('Criar Produto');

    if (state is SuccessProductState) {
      final product = state.product;
      if (product != null) {
        title = const Text('Editar Produto');
        _formData = product.toMap();
      }
      child = Column(
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  initialValue: _formData['name'],
                  onChanged: (value) => _formData['name'] = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  initialValue: _formData['description'],
                  onChanged: (value) => _formData['description'] = value,
                ),
                ElevatedButton(
                  onPressed: () => _onSubmit(context),
                  child: const Text("Adicionar"),
                )
              ],
            ),
          )
        ],
      );
    }

    if (state is LoadingShowProductState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: child,
    );
  }
}
