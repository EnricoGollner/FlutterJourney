import 'package:flutter/material.dart';
import 'package:gifs_search_app/app/data/models/gif_model.dart';
import 'package:gifs_search_app/app/data/repositories/gifs_repository.dart';

import '../widgets/gif_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? search;
  int offset = 0;

  @override
  Widget build(BuildContext context) {
    final GifsRepository gifsRepository =
        GifsRepository(search: search, offset: offset);

    return Scaffold(
      appBar: AppBar(
        title: Image.network(
            "https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Pesquise aqui",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
            onSubmitted: (text) {
              setState(() {
                text.isEmpty ? search = null : search = text;
                offset =
                    0; // se não ressetarmos, ele não vai mostrar os primeiros itens.
              });
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: gifsRepository.getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ));
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return _createGifTable(context, snapshot);
                    }
                }
              },
            ),
          ),
        ]),
      ),
    );
  }

  int _getCount(List data) {
    if (search == null) {
      // exibirá 20
      return data.length;
    } else {
      // exibirá 19
      return data.length + 1; // adicionando espaço no final para o ícone
    }
  }

  void _updateGifs() {
    setState(() {
      offset += 19;
    });
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    final List<GifModel> gifList = snapshot.data;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _getCount(gifList),
        itemBuilder: (context, index) {
          if (search == null || index < gifList.length) {
            final GifModel currentGif = gifList[index];
            return GifContainer(gif: currentGif);
          } else {
            return GestureDetector(
              onTap: _updateGifs,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 55,
                  ),
                  Text(
                    "Carregar mais",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
