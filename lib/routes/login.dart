import 'package:flutter/material.dart';
import 'package:app_secomp/base.dart';


class CamposLogin extends StatefulWidget {
  @override
  _CamposLoginState createState() => _CamposLoginState();
}

class _CamposLoginState extends State<CamposLogin> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(

      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFF33A4A0),
          Color(0xFF07CDA2),
          Color(0xFF0BB6A8),
          Color(0xFF0CADAA),
          Color(0xFF118BB2),
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
            key: _formKey,
            autovalidate: true,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: <Widget>[
                    LogoImageAsset(),
                    new TextFormField(
                            cursorColor: Colors.teal,
                            obscureText: false,
                            decoration: InputDecoration( 
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[300])),            
                                icon: Icon(Icons.person),
                                contentPadding: new EdgeInsets.fromLTRB(
                                    0.0, 0.0, 100.0, 0.0),
                                //border: OutlineInputBorder(),
                                labelText: 'Usuário',
                              )
                                ),
                  new Padding(
                    padding: EdgeInsets.all(8),
                  ),                                
                        new TextFormField(
                            cursorColor: Colors.teal,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              contentPadding: new EdgeInsets.fromLTRB(
                                    0.0, 0.0, 100.0, 0.0),
                                labelText: 'Senha')),
                          new InkWell( 
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: new Text('Esqueceu sua senha ?', style: TextStyle(color: Colors.teal[200], fontWeight: FontWeight.w800,),),
                            ),
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              //next_page
                                          ),
                                        );
                                       },
                            ),
                            new Padding(
              padding: new EdgeInsets.only(top: 80, bottom: 80),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Base()),
  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: new Container(
                  decoration: myBoxDecoration(),
                  padding: const EdgeInsets.only(
                      left: 132.0, right: 132.0, top: 15, bottom: 15),
                  child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                      Text('Não tem conta ?'),
                      new InkWell( 
                        child: new Text(' Crie uma conta', style: TextStyle(color: Colors.teal[200], fontWeight: FontWeight.w800),),
                        ),
                     ]
                  ),
              ],
            ),
          ),
      )
    );
  }
}

class LogoImageAsset extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('assets/logos/colorida-completa.png');
    Image image = Image(image: assetImage, width: 300, height: 300, alignment: Alignment.center,);
    return Container(child: image,);
  }

}

