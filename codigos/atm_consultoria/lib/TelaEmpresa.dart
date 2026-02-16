import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({Key? key}) : super(key: key);

  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Image.asset("imagens/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "SOBRE A EMPRESA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam "
                  "condimentum scelerisque dui, vitae malesuada massa. Vivamus "
                  "sit amet quam faucibus diam suscipit vulputate. Pellentesque"
                  " eget lorem ut ligula facilisis suscipit ac in nisl. Proin "
                  "blandit elit nec enim dictum hendrerit. Cras lobortis "
                  "efficitur porta. Interdum et malesuada fames ac ante ipsum "
                  "primis in faucibus. Fusce rutrum pulvinar tellus. Fusce "
                  "hendrerit, orci a sodales aliquet, tellus eros egestas augue,"
                  " eget malesuada tortor libero eu purus. Duis et mauris lacus."
                  " Ut sed risus dignissim, gravida arcu sit amet, viverra quam."
                  " Donec interdum dolor ut neque cursus tristique. Class aptent"
                  " taciti sociosqu ad litora torquent per conubia nostra, per "
                  "inceptos himenaeos. Etiam convallis velit ipsum, nec egestas "
                  "sapien euismod eu. Suspendisse vel vestibulum nisi. Quisque "
                  "cursus eleifend tellus, vel iaculis quam gravida eget. Sed "
                  "iaculis dictum bibendum. Duis interdum pulvinar aliquet. "
                  "Aenean eleifend orci vel nunc porta, eget ornare est "
                  "bibendum. Phasellus at tellus a nunc fringilla tempus a sit "
                  "amet metus. Class aptent taciti sociosqu ad litora torquent "
                  "per conubia nostra, per inceptos himenaeos. Phasellus "
                  "volutpat ante non nibh pellentesque, tempor congue enim "
                  "varius. Orci varius natoque penatibus et magnis dis "
                  "parturient montes, nascetur ridiculus mus. Curabitur et "
                  "ligula odio. Mauris tristique ut sem vitae eleifend. Vivamus "
                  "posuere massa blandit nulla varius elementum. Proin "
                  "tincidunt ligula at ex semper blandit. Aenean facilisis nisi "
                  "in urna gravida, eget tincidunt tortor dictum. Cras in "
                  "lectus libero. Nullam non porta felis, ac cursus velit. "
                  "Aliquam laoreet ut sapien vel sollicitudin. Quisque gravida "
                  "odio ut mollis condimentum. Donec tincidunt lobortis turpis, "
                  "tincidunt sodales elit laoreet ut. Maecenas sit amet laoreet "
                  "ex. Nunc fringilla euismod ipsum, in convallis sem tristique "
                  "vitae. Ut sed ipsum interdum ante gravida commodo non non "
                  "erat. Proin porta libero vel nisi commodo, in eleifend quam "
                  "consectetur. Aenean eu fringilla turpis, eget efficitur "
                  "velit. Nulla facilisis tortor id molestie posuere. Cras "
                  "ornare malesuada risus, ac commodo risus finibus consectetur."
                  " In dui quam, eleifend nec elementum at, efficitur eget nibh."
                  " In vestibulum varius dignissim. Sed efficitur quam eget orci"
                  " congue lobortis. Nam convallis nibh eget quam fermentum "
                  "vehicula. Aenean vel mi eget lectus malesuada lacinia. Mauris"
                  " consectetur pellentesque sapien, ut placerat sem. Ut tempus"
                  " massa ultricies elit hendrerit, id luctus magna laoreet. "
                  "Nulla nisi erat, vestibulum at felis quis, varius finibus "
                  "erat. Fusce lobortis imperdiet mauris, et elementum lorem "
                  "blandit ac. Maecenas consequat eu libero et eleifend. Ut "
                  "nunc mauris, sagittis dapibus libero sit amet, pharetra "
                  "rhoncus massa. Phasellus malesuada leo justo, ut congue enim"
                  " varius vitae. Integer sed enim vitae mi fermentum pretium. "
                  "Donec in placerat sapien, a pretium nunc. Maecenas tincidunt"
                  " lectus vel urna gravida, id accumsan ligula maximus. "
                  "Praesent condimentum posuere ligula, et gravida risus commodo"
                  " molestie. Etiam vitae sodales tortor. Sed a aliquam diam. "
                  "Quisque non sapien eu neque blandit interdum. Ut ac orci "
                  "convallis, aliquet lorem eu, volutpat ligula. Morbi leo "
                  "velit, feugiat eget magna at, condimentum fringilla nisl. "
                  "Sed hendrerit accumsan lacus, ut placerat quam aliquet at. ",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
