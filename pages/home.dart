import 'package:flutter/material.dart';
import 'package:tutorial001/services/storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data;

  String? _saved;

  void fetchSavedLocations() async {
    Future<dynamic> fdata = StorageService.getFavorites();
    await fdata.then((value) {
      setState(() {
        _saved = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSavedLocations();
  }

  @override
  Widget build(BuildContext context) {
    print(_saved);
    // data ??= ModalRoute.of(context)!.settings.arguments ;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            label: const Text(''),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/location');
        },
        backgroundColor: Colors.orangeAccent,
        child: const Text(
          '+',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
