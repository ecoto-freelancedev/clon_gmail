//Pantalla de busqueda de correos

import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:gmail_clone/search_result.dart';

class SearchMails extends StatelessWidget{
  final Map favoriteList;

  SearchMails(this.favoriteList);

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

  //Lista contiene la letra inicial, usada en el avatar de cada correo
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

  @override
  Widget build(BuildContext context) {
    return Material(
            child: new MaterialSearch<String>(
              leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey[600],
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            placeholder: 'Buscar mensaje',
            results: senderList.map((String v) => new MaterialSearchResult<String>(
              value: v,
              text: v,
            )).toList(),
            filter: (dynamic value, String criteria) {
              return value.toLowerCase().trim()
                .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
            },
            onSelect: (dynamic value) {
              Navigator.pushReplacement(context, new MaterialPageRoute(
                builder: (BuildContext context) => new SearchResults(value,favoriteList)
                )
              );
              
            },
            onSubmit: (String value) {
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new SearchResults(value,favoriteList)
                )
              );
            }
          ),
        );
  }
}

