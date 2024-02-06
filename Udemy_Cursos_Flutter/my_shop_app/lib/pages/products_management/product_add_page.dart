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
  final Map<String, dynamic> _formData = <String, Object>{};

  final TextEditingController _urlImageController = TextEditingController();

  final FocusNode _priceFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _urlImageFocus = FocusNode();

  @override
  void initState() {
    _productListProvider = Provider.of<ProductList>(context, listen: false);
    _urlImageFocus.addListener(updateImage);

    super.initState();
  }

  @override
  void dispose() {
    _urlImageController.dispose();

    _priceFocus.dispose();
    _descriptionFocus.dispose();

    _urlImageFocus.removeListener(updateImage);
    _urlImageFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Form'), actions: [
        IconButton(
          onPressed: _submitForm,
          icon: const Icon(Icons.save),
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  label: 'Name',
                  validatorFunction: Validator.isRequired,
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocus),
                  onSaved: (name) => _formData['name'] = name ?? '',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  focusNode: _priceFocus,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_descriptionFocus),
                  onSaved: (price) => _formData['price'] = Formatters.currencyToDouble(price ?? '0'),
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
                  focusNode: _descriptionFocus,
                  onSaved: (description) => _formData['description'] = description?.trim() ?? '',
                  label: 'Description',
                  maxLines: 3,
                  validatorFunction: (text) => Validator.isRequiredAndMinLength(text: text, minLength: 10),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        keyboardType: TextInputType.url,
                        focusNode: _urlImageFocus,
                        textInputAction: TextInputAction.done,
                        label: 'URL Image',
                        validatorFunction: Validator.isValidImageUrl,
                        controller: _urlImageController,
                        onFieldSubmitted: (_) => _submitForm(),
                        onSaved: (urlImage) => _formData['urlImage'] = urlImage?.trim() ?? '',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Visibility(
                        visible: Validator.isValidImageUrl(_urlImageController.text) == null,
                        replacement: const Center(
                          child: Text('Inform the URL'),
                        ),
                        child: Image.network(_urlImageController.text),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateImage() {
    setState(() {});
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _productListProvider.addProductFromData(_formData);
      Navigator.pop(context);
    }
  }
}
