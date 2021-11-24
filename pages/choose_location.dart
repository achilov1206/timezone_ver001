import 'package:flutter/material.dart';
import 'package:tutorial001/services/worldtime.dart';

import '../models/location.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<dynamic> data = [];

  List<String> filterValues = <String>[
    'All',
    'Asia',
    'Africa',
    'America',
    'Antarctica',
    'Atlantic',
    'Australia',
    'Europe',
    'Indian',
    'Pacific',
  ];

  String choosedContinent = 'All';
  
  void fetchLocations([choosedContinent]) async {
    dynamic continent = choosedContinent == 'All' ? null : choosedContinent;
    Future<dynamic> fdata = WorldTimeService.getLocations(continent);
    await fdata.then((futureData) {
      setState(() {
        data = futureData;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        actions: [
          DropdownButton<String>(
            selectedItemBuilder: (_) {
              return filterValues
                  .map(
                    (e) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList();
            },
            value: choosedContinent,
            onChanged: (String? newValue) {
              setState(() {
                data = [];
                choosedContinent = newValue!;
                fetchLocations(choosedContinent);
              });
            },
            alignment: AlignmentDirectional.centerEnd,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 24,
            elevation: 0,
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            items: filterValues.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            height: 40,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                border: InputBorder.none,
                hintText: 'Search for a City',
                icon: Container(
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                  ),
                  margin: const EdgeInsets.only(left: 10),
                ),
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(50),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.deepOrangeAccent,
                  size: 20,
                ),
                label: const Text(''),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/locationdetail', arguments: data[index]);
              },
              title: Text('${data[index].city}'),
              subtitle: Text('${data[index].continent}'),
            ),
          );
        },
      ),
    );
  }
}
