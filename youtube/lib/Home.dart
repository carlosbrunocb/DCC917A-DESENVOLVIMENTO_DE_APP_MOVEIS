import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexBar = 0;
  String _resultadoDaBusca = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("1o Método Chamado - initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("2o Método Chamado - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("2o Método Chamado - didChangeDependencies");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("4o Método Chamado - dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("3o Método Chamado - build");

    List<Widget> telas = [
      Inicio(_resultadoDaBusca),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          'imagens/youtube.png',
          width: 100,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              print("Icons.search");
              String? res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              setState(() {
                _resultadoDaBusca = res!;
              });
              print(res);

            },
          ),
          // IconButton(
          //   icon: Icon(Icons.videocam),
          //   onPressed: () {
          //     print("Icons.videocam");
          //   },
          // ),
          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {
          //     print("Icons.account_circle");
          //   },
          // ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: telas[_indexBar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexBar,
        onTap: (value) {
          setState(() {
            _indexBar = value;
          });
        },
        //Tipos de BottomNavigationBar
        //shifting: Acima de 3 botões ele muda para
        // shifting, para dá um efeito destaque
        //fixed: Volta para valor padrão
        type: BottomNavigationBarType.fixed,
        // unselectedItemColor: Colors.grey,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
