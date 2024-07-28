import 'package:flutter/material.dart';
import 'package:flutter_application_1/modem.dart';
import 'package:flutter_application_1/read_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<List<Item>> itemsNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    ToRead();
  }

  Future<void> ToRead() async {
    final items = await readJson();
    itemsNotifier.value = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(89, 255, 193, 7),
        title: const Text('To read from json'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ValueListenableBuilder<List<Item>>(
          valueListenable: itemsNotifier,
          builder: (context, items, _) {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.description),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
