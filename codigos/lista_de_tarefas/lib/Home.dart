import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      body: Text("Contéudo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   // backgroundColor: Colors.purple,
      //   // foregroundColor: Colors.black,
      //   elevation: 10,
      //   // mini: true,
      //   onPressed: (){
      //
      //   },
      // ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 10,
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(3),
        // ),
        onPressed: (){

        },
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color: Colors.grey,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                print("Foi pressionado");
              },
            ),
          ],
        ),
      ),
    );
  }
}
