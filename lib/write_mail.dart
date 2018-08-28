//PANTALLA DE REDACTAR CORREO

import 'package:flutter/material.dart';

class Write_mail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail',
      color: Colors.red,
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Redactar'),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.attachment),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  const PopupMenuItem<String>(
                    value: 'Añadir de Contactos', 
                    child: Text('Añadir de Contactos')
                  ),
                  const PopupMenuItem<String>(
                    value: 'Modo confidencial', 
                    child: Text('Modo confidencial')
                  ),
                  const PopupMenuItem<String>(
                    enabled: false,
                    value: 'Guardar borrador', 
                    child: Text('Guardar borrador')
                  ),
                  const PopupMenuItem<String>(
                    value: 'Descartar', 
                    child: Text('Descartar')
                  ),
                  const PopupMenuItem<String>(
                    value: 'Ajustes', 
                    child: Text('Ajustes')
                  ),
                  const PopupMenuItem<String>(
                    value: 'Ayuda y sugerencias', 
                    child: Text('Ayuda y sugerencias')
                  ),
                ],
              ),
            ],
          ),
          body: WriteMailScreen()),
    );
  }
}

class WriteMailScreen extends StatefulWidget {
  createState() => WriteMailScreenState();
}

class WriteMailScreenState extends State<WriteMailScreen> {
  final emails = ['ecoto30@gmail.com'];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Text(
            'De',
            style: TextStyle(
              color: Colors.grey[600], 
              fontSize: 16.0
            ),
          ),
          title: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
          trailing: PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                  value: 'bro11@gmail.com', 
                  child: Text('bro11@gmail.com')
              )
            ],
            icon: Icon(Icons.keyboard_arrow_down),
          ),
        ),
        Divider(),
        ExpansionTile(
          leading: Text(
            'Para',
            style: TextStyle(
              color: Colors.grey[600], 
              fontSize: 16.0
            ),
          ),
          title: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
          children: <Widget>[
            Divider(),
            ListTile(
              leading: Text(
                'CC',
                style: TextStyle(
                  color: Colors.grey[600], 
                  fontSize: 16.0
                ),
              ),
              title: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                'CCO',
                style: TextStyle(
                  color: Colors.grey[600], 
                  fontSize: 16.0
                ),
              ),
              title: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Divider(),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
                hintText: 'Asunto', 
                border: InputBorder.none
            ),
          ),
        ),
        Divider(),
        ListTile(
          title: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 50,
            decoration: InputDecoration(
              hintText: 'Escribe un correo', 
              border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}
