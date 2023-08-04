import 'package:flutter/material.dart';

import '../../utils/route_utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['source']['name'],
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        data['urlToImage'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data['title'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "              ${data['description']}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "              ${data['content']}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    MyRoutes.webPage,
                    arguments: data['url'],
                  );
                  print(data['url']);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
