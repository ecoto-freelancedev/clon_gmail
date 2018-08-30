//CLON GMAIL APP 
//CÓDIGO ESCRITO POR EDUARDO COTO
//La app simula la app de Google con ListViews para mostrar las listas 
//de correos en la bandeja principal y de busqueda de mensajes.
//NOTA: la app no está completa y tiene secciones que aún no están implementadas 
//y en el archivo "pubspec.yaml", se incluyen fuentes y librerias externas usadas. 

import 'package:flutter/material.dart';
import 'package:gmail_clone/search_mails.dart';
import 'package:gmail_clone/write_mail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Gmail';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
        title: title,
        theme: ThemeData(primaryColor: Colors.red),
        home: SearchList());
  }
}

class SearchList extends StatefulWidget {
  @override
  createState() => SearchListState();
}

class SearchListState extends State<SearchList> with TickerProviderStateMixin {
  //Lista contiene los remitentes de cada correo
  static const List<String> senderList = const <String>[
    'Android Weekly',
    'Flutter Weekly',
    'Kotlin Weekly',
    'Android Weekly',
    'Flutter Weekly',
    'Kotlin Weekly',
    'Android Weekly',
    'Flutter Weekly',
    'Kotlin Weekly',
  ];

  //Lista contiene los asuntos de cada correo
  static const List<String> subjectList = const <String>[
    'Android Weekly #304',
    'Flutter Weekly #14',
    'Kotlin Weekly #104',
    'Android Weekly #303',
    'Flutter Weekly #13',
    'Kotlin Weekly #103',
    'Android Weekly #302',
    'Flutter Weekly #12',
    'Kotlin Weekly #102',
  ];

  //Lista contiene los detalles de cada correo
  static const List<String> detailList = const <String>[
    'View in browser Android Weekly #304 A...',
    'A weekly newsletter for flutter fans by fl...',
    'kotlinweekly/kotlin-weekly-1...',
    'View in browser Android Weekly #303 A...',
    'A weekly newsletter for flutter fans by fl...',
    'kotlinweekly/kotlin-weekly-1...',
    'View in browser Android Weekly #302 A...',
    'A weekly newsletter for flutter fans by fl...',
    'kotlinweekly/kotlin-weekly-1...',
  ];

  //Lista contiene la letra inicial del remitente, usada en el avatar de cada correo
  static const List<String> letterList = const <String>[
    'A',
    'F',
    'K',
    'A',
    'F',
    'K',
    'A',
    'F',
    'K',
  ];

  //Lista contiene el estado favorito de cada correo
  var favoriteStateList =[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true; 
  var favoriteList = Map();
  
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = new CurvedAnimation(
      parent: new ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = new Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Principal',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new SearchMails(favoriteList)
                )
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: const Text('Bro'),
            accountEmail: const Text('bro11@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/photo_profile.png'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/wallpaper_user.png'),
                  fit: BoxFit.fill),
            ),
            onDetailsPressed: () {
              _showDrawerContents = !_showDrawerContents;
              if (_showDrawerContents)
                _controller.reverse();
              else
                _controller.forward();
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 8.0),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    FadeTransition(
                      opacity: _drawerContentsOpacity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              const IconData(0xe900, fontFamily: 'icomoon'),
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Todas las bandejas',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(
                              Icons.inbox,
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Principal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.people,
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Social',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.local_offer,
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Promociones',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Notificaciones',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Todas las etiquetas',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.star,
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Destacados',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.watch_later,
                              color: Colors.grey[700],
                            ),
                            title: Text(
                              'Pospuestos',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){
                              
                            },
                          ),
                        ],
                      ),
                    ),
                    SlideTransition(
                      position: _drawerDetailsPosition,
                      child: FadeTransition(
                        opacity: ReverseAnimation(_drawerContentsOpacity),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.add,
                                color: Colors.grey[700],
                              ),
                              title: const Text(
                                'Añadir cuenta',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {

                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: Colors.grey[700],
                              ),
                              title: const Text(
                                'Administrar cuentas',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          bool _alreadyFavorite = favoriteStateList.elementAt(index);
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          child: Text(
                            letterList[index],
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Raleway'
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.label_important,
                                color: Colors.yellow[300],
                                size: 20.0,
                              ),
                              Text(
                                senderList[index],
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          Text(
                            subjectList[index],
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            detailList[index],
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 20.0,
                          width: 40.0,
                          child: Text(
                            '18jul',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              //Marca o desmarca como favorito
                              _alreadyFavorite ? Icons.star : Icons.star_border,
                              color: _alreadyFavorite ? Colors.yellow[800] : Colors.grey[600],
                            ),
                            iconSize: 25.0,
                            color: Colors.grey[600],
                            onPressed: (){
                              setState(() {
                                if (_alreadyFavorite) {//sí ya es favorito
                                  //correo ya no es favorito
                                  favoriteStateList[index] = false;
                                  favoriteList.remove('${subjectList[index]}');
                                }
                                else {
                                  //correo es favorito
                                  favoriteStateList[index] = true;
                                  favoriteList['${subjectList[index]}'] = true;
                                }
                              });
                            }
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider()
            ],
          );
        },
        itemCount: senderList.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.edit),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new Write_mail()
                )
              );
        },
      ),
    );
  }
}

