import 'package:flutter/material.dart';
import 'package:reading_app/components/theme.dart';
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
    return Center(
        child: FutureBuilder(
          future: ApiService().getBook(widget.work),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final value = snapshot.data!;
              return FutureBuilder(
                future: ApiService().getAuthor(value.author),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final author = snapshot.data!;
                    return Text(author);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );
  }
}
