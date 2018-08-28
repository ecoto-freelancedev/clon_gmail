//PANTALLA DE RESULTADOS DE BUSQUEDA DE CORREOS

import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget{
  final String title = 'Gmail';
  final String value;
  final Map favotiteList;
    
  SearchResults(this.value,this.favotiteList);
  
  @override
  Widget build(BuildContext context) {
    return SearchListResult(value,favotiteList);
  }

}

class SearchListResult extends StatefulWidget {
  final String value;
  final Map favotiteList;
  SearchListResult(this.value,this.favotiteList);

  @override
  createState() => SearchListResultState(value,favotiteList);
}

class SearchListResultState extends State<SearchListResult>{
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

  

final  myController = new TextEditingController();

bool _isSearching;
String _searchText = "";

final String value;
final Map favotiteList;
  SearchListResultState(this.value,this.favotiteList){
    myController.addListener(() {
      if (myController.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _isSearching = true;
          _searchText = myController.text;
        });
      }
    });
  }

  @override
    void initState() {
      super.initState();
      myController.text = value;
      _isSearching = false;
    }

  //Crea y muestra la lista con los resultados de busqueda
  _buildSearchSenderList() {
    var _senderSearchList = List();
    var _letterSearchList = List();
    var _subjectSearchList = List();
    var _detailSearchList = List();
      for (int i = 0; i < senderList.length; i++) {
        String  sender = senderList.elementAt(i);
        if (sender.toLowerCase().contains(_searchText.toLowerCase())) {
          _senderSearchList.add(sender);
          _letterSearchList.add(sender[0]);
          _subjectSearchList.add(subjectList[i]);
          _detailSearchList.add(detailList[i]);
        }
      }
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          bool _alreadyFavorite = favotiteList.containsKey(_subjectSearchList[index]);
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
                            _letterSearchList[index],
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
                                _senderSearchList[index],
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          Text(
                            _subjectSearchList[index],
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            _detailSearchList[index],
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
                          child: Icon(
                             //Si es favorito queda marcado como favorito
                              _alreadyFavorite ? Icons.star : Icons.star_border,
                              color: _alreadyFavorite ? Colors.yellow[800] : Colors.grey[600],
                              size: 25.0,
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
        itemCount: _senderSearchList.length,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[600],
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey[600],
            ),
            onPressed: (){
              myController.clear();
            },
          ),
        ],
        title: TextField(
          controller: myController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),

        ),
      ),
      body: _buildSearchSenderList(),
    );
  }

}