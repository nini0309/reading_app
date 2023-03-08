import 'package:flutter/material.dart';
import 'package:reading_app/services/api.dart';

class BookDisplay extends StatefulWidget {
  BookDisplay({super.key, required this.work});
  final String work;

  @override
  State<BookDisplay> createState() => _BookDisplayState();
}

class _BookDisplayState extends State<BookDisplay> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Item 1';

    // List of items in our dropdown menu
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return Scaffold(
      backgroundColor: Color(0xffF5EBE0),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
          child: FutureBuilder(
        future: ApiService().getBook(widget.work),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final value = snapshot.data!;
            final cover = value.cover;
            return Column(
              children: [
                Container(
                  color: Colors.white10,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.network(
                        'https://covers.openlibrary.org/b/id/$cover-M.jpg',
                        width: 150,
                        height: 250,
                      ),
                      Text(value.title),
                      FutureBuilder(
                        future: ApiService().getAuthor(value.author),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final author = snapshot.data!;
                            return Text(author);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(child: Text(value.description)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: 60,
                        )
                    ),
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
