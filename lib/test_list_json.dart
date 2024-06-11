// INDRIANA NOVIYANTI
// 1304201002

import 'package:flutter/material.dart';
import 'package:flutter_demo_week_12/product_model.dart';
import 'package:http/http.dart' as http;



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  Future<List> _loadData() async {
    List products = [];

    var response = await http.get(
      Uri.parse('http://192.168.0.107/api/products'),
      headers: {
        'Authorization': 'Bearer 3|ZJ0TTagZh51mmstALLTtmEhOkOWhfnmqCoYBgNa4d1d8d7bd',
      },
    );

    products = parseProducts(response.body);

    return products;

  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Example')),

      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Products> data = snapshot.data as List<Products>;
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //var post = snapshot.data![index];
                return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                        title: Text(data![index].name),
                        subtitle: Text(data![index].price.toString()),
                ));
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}