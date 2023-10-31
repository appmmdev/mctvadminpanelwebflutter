import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mctvadminweb/modal/movie_modal.dart';

import '../Cons/const_data.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final formkey = GlobalKey<FormState>();

  var movietitlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var movie_cover_imgcontroller = TextEditingController();

  var linkcontroller = TextEditingController();
  var yearcontroller = TextEditingController();
  var studiocontroller = TextEditingController();
  var convertedjson = TextEditingController();

  var totalpost = '0';

  @override
  void initState() {
    super.initState();
  }

  List<MovieModal> dataList = [];

  List<String> temporary_category = [
    'Movies',
  ];

  List<bool> selectedCategories = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  void copytoClipboard() async {
    await Clipboard.setData(ClipboardData(text: convertedjson.text));
  }

  void getList() {
    var catelist = temporary_category.toString();

    var formattedcatelist = catelist.substring(1, catelist.length - 1);
    dataList.add(MovieModal(
        movietitlecontroller.text,
        descriptioncontroller.text,
        movie_cover_imgcontroller.text,
        movie_cover_imgcontroller.text,
        linkcontroller.text,
        yearcontroller.text,
        formattedcatelist,
        studiocontroller.text));
    totalpost = '' + dataList.length.toString();

    var encoder = JsonEncoder.withIndent("");

    var ss = encoder.convert(dataList).toString();

    var formattedString = ss.substring(1, ss.length - 1);
    convertedjson.text = formattedString.toString();

    setState(() {
      cleartext();
    });
  }

  void cleartext() {
    movietitlecontroller.text = '';
    descriptioncontroller.text = '';
    movie_cover_imgcontroller.text = '';

    linkcontroller.text = '';
    studiocontroller.text = '';
    yearcontroller.text = '';
    temporary_category = [];

    selectedCategories = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
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
                  child: Container(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                                controller: movietitlecontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Movie Title can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Movie Title',
                                    border: OutlineInputBorder())),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                                controller: movie_cover_imgcontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Movie Image can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Movie Image',
                                    border: OutlineInputBorder())),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                                controller: linkcontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Link can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Movie Link',
                                    border: OutlineInputBorder())),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                                controller: descriptioncontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Description can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                                maxLines: 5,
                                decoration: const InputDecoration(
                                    labelText: 'Description',
                                    border: OutlineInputBorder())),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: TextFormField(
                                      controller: studiocontroller,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Studio can't be Empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'Studio',
                                          border: OutlineInputBorder())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: TextFormField(
                                      controller: yearcontroller,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Year can't be Empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'Year',
                                          border: OutlineInputBorder())),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 200,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    8, // Adjust the number of columns as needed
                              ),
                              itemCount: Const_Data.category_list.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(Const_Data.category_list[index]),
                                    Checkbox(
                                      value: selectedCategories[index],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCategories[index] = value!;
                                          if (value) {
                                            temporary_category.add(Const_Data
                                                .category_list[index]);
                                          } else {
                                            temporary_category.remove(Const_Data
                                                .category_list[index]);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (formkey.currentState!
                                              .validate()) {
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
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Text('Total Post in List\t ${totalpost}\t post'),
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
