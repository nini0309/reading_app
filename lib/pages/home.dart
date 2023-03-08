import 'package:flutter/material.dart';
import 'package:reading_app/components/theme.dart';
import 'package:reading_app/pages/book.dart';
import 'package:reading_app/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
            index: 1,
            title: 'Home',
            body: TrendingList());
  }
}

class TrendingList extends StatefulWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trending'),
        FutureBuilder(
          future: ApiService().getTrending(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final value = snapshot.data![index];
                      final id = value.id;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookDisplay(work: value.key)));
                        },
                        child: Image.network(
                          'https://covers.openlibrary.org/b/olid/$id-M.jpg',
                          width: 120,
                          height: 200,
                          frameBuilder: (BuildContext context, Widget child, int? frame, bool? wasSynchronouslyLoaded) {
                            // if(!wasSynchronouslyLoaded!)
                            //   {
                            //     return Ink(
                            //       width: 120,
                            //       height: 200,
                            //       color: Colors.grey,
                            //     );
                            //   }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: child,
                            );
                          },
                        ),
                      );
                    }),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      ],
    );
  }
}
