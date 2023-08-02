import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';
import '../../utils/route_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Consumer<ApiController>(
        builder: (context, provider, child) {
          List data = provider.data;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onSubmitted: (value) {
                      provider.search(val: value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Search",
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyRoutes.detailPage,
                            arguments: data[index],
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: (data[index]['urlToImage'] == null)
                              ? Image.network(
                                  "https://avatars.mds.yandex.net/i?id=970e03feb88cfdde7cabd9739474343a-5213492-images-thumbs&n=13")
                              : Image.network(
                                  data[index]['urlToImage'],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
