import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/products/product_action.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:crud_app/src/modules/products/product_model.dart';
import 'package:flutter/material.dart';

class ProductUpsertPage extends StatefulWidget {
  final String? id;

  const ProductUpsertPage({super.key, this.id});

  @override
  State<ProductUpsertPage> createState() => _ProductUpsertPageState();
}

class _ProductUpsertPageState extends State<ProductUpsertPage> {
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
  initState() {
    super.initState();
    if (widget.id != null) {
      getProduct(widget.id!).then((_) {
        product = $currentProduct.value!.copyWith();
      });
    } else {
      $currentProduct.value = ProductModel(name: '', description: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.id != null ? 'Editar' : 'Criar'} Produto'),
      ),
      body: RxBuilder(
        builder: (context) {
          return $productLoading.value
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
                            initialValue: $currentProduct.value?.name,
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
                            initialValue: $currentProduct.value?.description,
                            onChanged: (value) {
                              product = product.copyWith(description: value);
                            },
                          ),
                          ElevatedButton(
                            onPressed: () => _onSubmit(context),
                            child: Text(
                                "${widget.id != null ? 'Editar' : 'Criar'}"),
                          )
                        ],
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
