import 'package:conversorapp/src/stores/moeda_store.dart';
import 'package:flutter/material.dart';

class ConversorPage extends StatefulWidget {
  const ConversorPage({super.key});

  @override
  State<ConversorPage> createState() => _MoedaPageState();
}

class _MoedaPageState extends State<ConversorPage> {
  final MoedaStore store = MoedaStore();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    store.addListener(_listenner);

    //Executado no próximo frame - após tudo ter sido desenhado (como um "after state")
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.getMoedas();
    });
  }

  void _listenner() {
    setState(() {});
  }

  @override
  void dispose() {
    store.removeListener(_listenner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Conversor de moedas'),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _ctrlInput,
              decoration: InputDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}
