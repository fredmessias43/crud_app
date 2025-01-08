import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/products/product_action.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:crud_app/src/modules/products/product_model.dart';
import 'package:flutter/material.dart';

class ProductUpsertForm extends StatefulWidget {
  final String? id;
  final Function afterSubmit;

  const ProductUpsertForm({super.key, this.id, required this.afterSubmit});

  @override
  State<ProductUpsertForm> createState() => _ProductUpsertFormState();
}

class _ProductUpsertFormState extends State<ProductUpsertForm> {
  final _form = GlobalKey<FormState>(debugLabel: 'upsert');

  var product = ProductModel(name: '', description: '');

  _onSubmit(context) async {
    final isValid = _form.currentState?.validate() ?? false;
    if (isValid) {
      _form.currentState!.save();
      await upsertProduct(product);
      widget.afterSubmit();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      getProduct(widget.id!);
    } else {
      clearCurrentProduct();
    }

    return AtomBuilder(
      builder: (context, get) {
        final loading = get($productLoading);
        final currentProduct = get($currentProduct);
        product = currentProduct ?? product;

        return loading
            ? const CircularProgressIndicator()
            : Column(
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
                          initialValue: currentProduct?.name,
                          onChanged: (value) {
                            product = product.copyWith(name: value);
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Descrição'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          initialValue: currentProduct?.description,
                          onChanged: (value) {
                            product = product.copyWith(description: value);
                          },
                        ),
                        ElevatedButton(
                          onPressed: () => _onSubmit(context),
                          child: Text(widget.id != null ? 'Editar' : 'Criar'),
                        )
                      ],
                    ),
                  )
                ],
              );
      },
    );
  }
}
