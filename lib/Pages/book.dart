import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mctvadminweb/modal/bookmodal.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final formkey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var writerController = TextEditingController();

  var convertedjson = TextEditingController();

  var totalpost = '0';

  bool lock = false;

  @override
  void initState() {
    super.initState();
  }

  List<BookModal> dataList = [];

  void copytoClipboard() async {
    await Clipboard.setData(ClipboardData(text: convertedjson.text));
  }

  void getList() {
    dataList.add(BookModal(
        title: titleController.text,
        content: contentController.text,
        writer: writerController.text));
    totalpost = dataList.length.toString();

    var encoder = const JsonEncoder.withIndent("");

    var ss = encoder.convert(dataList).toString();

    var formattedString = ss.substring(1, ss.length - 1);
    convertedjson.text = formattedString.toString();

    setState(() {
      cleartext();
    });
  }

  void cleartext() {
    titleController.text = '';
    contentController.text = '';
    if (!lock) {
      writerController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                              controller: titleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Book Title can't be Empty";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Book Title',
                                  border: OutlineInputBorder())),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: TextFormField(
                                    controller: writerController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Book Writer can't be Empty";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        labelText: 'Book Writer',
                                        border: OutlineInputBorder())),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: lock,
                                    onChanged: ((value) {
                                      lock = value!;
                                      setState(() {});
                                    })),
                                const Text('Lock')
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                              controller: contentController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Content can't be Empty";
                                } else {
                                  return null;
                                }
                              },
                              maxLines: 5,
                              decoration: const InputDecoration(
                                  labelText: 'Content',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (formkey.currentState!.validate()) {
                                        getList();
                                      }
                                    });
                                  },
                                  child: const Text('Add')),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    cleartext();

                                    convertedjson.text = '';

                                    dataList = [];
                                  },
                                  child: const Text('Reset')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Text('Total Post in List\t $totalpost\t post'),
                      Container(
                        width: 400,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextFormField(
                            controller: convertedjson,
                            maxLines: 23,
                            decoration: const InputDecoration(
                                labelText: 'Converted JSON Format',
                                border: OutlineInputBorder())),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              copytoClipboard();
                            });
                          },
                          child: const Text('Copy')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
