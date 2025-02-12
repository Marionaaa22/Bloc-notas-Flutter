import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la marca de agua de "DEBUG"
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _notes = []; // Lista para guardar notas

  void _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _notes.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }
  
  void _removeAllNotes() {
    setState(() {
      _notes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Cambia el color de fondo aquí
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bolc de Notes digital'),
          centerTitle: true,
          backgroundColor: Colors.grey[200], // Cambia el color del AppBar aquí
          titleTextStyle: TextStyle(
            color: Colors.black, // Cambia el color del título aquí
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent, // Hace que el Scaffold sea transparente
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Escriu una nota',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.black), // Cambia el color del texto aquí
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Cambia el color del botón aquí
                  foregroundColor: Colors.black, // Cambia el color del texto aquí
                  elevation: 0, // Elimina la sombra del botón
                  side: BorderSide(color: Colors.black), // Agrega un borde de color negro
                ),
                child: Text('Afegir Nota'),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_notes[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: const Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () => _removeNote(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}