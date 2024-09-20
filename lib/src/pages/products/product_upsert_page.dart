// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

import 'package:crud_app/src/core/widgets/crud_app_scaffold.dart';
import 'package:crud_app/src/modules/products/product_action.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:crud_app/src/modules/products/product_model.dart';

class ProductUpsertPage extends StatelessWidget {
  final String? id;

  ProductUpsertPage({
    super.key,
    this.id,
  });

  final _form = GlobalKey<FormState>(debugLabel: 'upsert');
  ProductModel product = ProductModel(name: '', description: '');

  _onSubmit(context) async {
    final isValid = _form.currentState?.validate() ?? false;
    if (isValid) {
      _form.currentState!.save();
      await upsertProduct(product);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (id != null) {
      getProduct(id!);
    } else {
      clearCurrentProduct();
    }

    return AtomBuilder(builder: (context, get) {
      final loading = get($productLoading);
      final currentProduct = get($currentProduct);
      product = currentProduct ?? product;

      return CrudAppScaffold(
        title: Text('${id != null ? 'Editar' : 'Criar'} Produto'),
        child: AtomBuilder(
          builder: (context, state) {
            return loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Form(
                        key: _form,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Nome'),
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
                              decoration:
                                  const InputDecoration(labelText: 'Descrição'),
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
                              child: Text(id != null ? 'Editar' : 'Criar'),
                            )
                          ],
                        ),
                      )
                    ],
                  );
          },
        ),
      );
    });
  }
}
