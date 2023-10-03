import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';

import 'BottomNavigation.dart';
import 'ContentPage.dart';


String stringResponse = " ";
Map<dynamic,dynamic> mapResponse = { } ;
List listResponse = [];

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Future<void> fetchBlogs() async {
    // String stringResponse ;

    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';



      try {
        final response = await http.get(Uri.parse(url), headers: {
          'x-hasura-admin-secret': adminSecret,
        });

        if (response.statusCode == 200) {


          // Request successful, handle the response data here
          setState(() {
            // stringResponse = response.body;
            mapResponse = jsonDecode(response.body);
            listResponse = mapResponse['blogs'];
          });

          print('list items: ${listResponse.length}');
          print("URL HIT");
          print('Response data: ${listResponse[0]}');

        } else {
          // Request failed
          print('Request failed with status code: ${response.statusCode}');
          print('Response failed : ${response.body}');
        }
      } catch (e) {
        // Handle any errors that occurred during the request
        print('Error: $e');
      }




  }


  @override
  void initState() {
    fetchBlogs();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            "Blog Post",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
        ),
        actions: [
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/photo.jpeg'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.notifications_outlined,color: Colors.grey,),
                  ),
                  Positioned(
                    top: 6,
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        backgroundColor: Color(0xFFFFD810),
        elevation: 0,
        onPressed: (){},
      ),
      
      body: Container(
        padding: EdgeInsets.all(9.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for articles, author, and tags',
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide.none),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Daily Need",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20,),

                Container(
                  height: MediaQuery.of(context).size.height - 347,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // separatorBuilder: (context , index ) => Divider(),
                      itemCount: listResponse.length,
                      itemBuilder: (context , index ) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ContentPage(title: listResponse[index]['title'],image: listResponse[index]['image_url'],)
                                ));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 75,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(listResponse[index]['image_url']),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(listResponse[index]['title'] , style: TextStyle(fontSize: 15, color: Colors.white),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),

      // body: Container(
      //   padding: EdgeInsets.all(9.0),
      //   child: ListView.builder(
      //       itemCount: listResponse.length,
      //       itemBuilder: (context , index){
      //       return Container(
      //
      //         child: Column(
      //           children: [
      //             Padding(
      //                 padding: EdgeInsets.all(8.0),
      //                 child: Image.network(listResponse[index]['image_url']),
      //             ),
      //             Text(listResponse[index]['title']),
      //           ],
      //         ),
      //       );
      //     }),
      // ),
    );
  }
}
