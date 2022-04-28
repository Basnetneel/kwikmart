// // ignore_for_file: sized_box_for_whitespace

// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//    SearchPage({ Key? key }) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Container(
//           height: 45,
//           child: TextField(
//             autofocus: true,
//             cursorColor: Colors.grey,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: const Icon(Icons.search, color: Colors.black),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 borderSide: BorderSide.none
//               ),
//               hintText: "Search e.g Sweatshirt",
//               hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Opacity(
//             opacity: .7,
//             child: Container(
//               width: double.infinity,
//               height: 250, 
//               child: const Image( image:  AssetImage("assets/images/search.png")),
//             )
//           ),
//           const SizedBox(height: 40,),
//           const Text("Type to search ...", style: TextStyle(fontSize: 20),)
//         ],
//       )
//     );
//   }
// }



import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget
{
  SearchPage({Key? key, required this.title}) : super(key:key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context,delegate: CustomSearchDelegate(),);
              },
              icon: const Icon(Icons.search),)
        ],
      ),
    );

  }
}

class CustomSearchDelegate extends SearchDelegate
{
  List<String> searchTerms = ['Apple','Banana',"Pear","Watermelons","Oranges","Blueberries","Strawberries","Raspberries",];

  @override
  List<Widget> buildActions(BuildContext context) {

    return[
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.clear))
    ];


  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var fruit in searchTerms)
      {
        if(fruit.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(fruit);
        }
      }
    return ListView.builder(itemBuilder: (context,index){
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    },itemCount: matchQuery.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> matchQuery = [];

    for(var fruit in searchTerms)
      {
        if(fruit.toLowerCase().contains(query.toLowerCase()))
          {
            matchQuery.add(fruit);
          }
      }

    return ListView.builder(itemBuilder: (context,index){
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    },itemCount: matchQuery.length,);
  }

}