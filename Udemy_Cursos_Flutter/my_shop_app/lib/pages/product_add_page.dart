import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/utils/decimal_text_input_formatter.dart';
import 'package:shop/core/utils/formatters.dart';
import 'package:shop/core/utils/validator.dart';
import 'package:shop/data/models/product.dart';
import 'package:shop/data/models/product_list.dart';
import 'package:shop/pages/components/custom_text_field.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  late ProductList _productListProvider;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _urlImageController = TextEditingController();

  @override
  void initState() {
    _productListProvider = Provider.of<ProductList>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Form'), actions: [
        IconButton(
          onPressed: _addProduct,
          icon: const Icon(Icons.save),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Name',
                validatorFunction: Validator.isRequired,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                prefix: 'R\$ ',
                label: 'Price',
                validatorFunction: Validator.isRequired,
                inputFormatters: [
                  DecimalTextInputFormatter.signal,
                  DecimalTextInputFormatter(),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 3,
                validatorFunction: (text) => Validator.isRequiredAndMinLength(text: text, minLength: 10),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _urlImageController,
                      onChanged: (urlString) {
                        setState(() {
                          if (urlString != null) _urlImageController.text = urlString;
                        });
                      },
                      label: 'URL Image',
                      validatorFunction: Validator.isRequired,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Visibility(
                      visible: _urlImageController.text.isNotEmpty,
                      replacement: const Center(
                        child: Text('Inform the URL'),
                      ),
                      child: Image.network(_urlImageController.text),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      final Product newProduct = Product(
        id: Random().nextDouble().toString(),
        title: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        price: Formatters.currencyToDouble(_priceController.text),
        imageUrl: _urlImageController.text.trim(),
      );

      _productListProvider.addProduct(newProduct);
    }
  }
}
