import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mctvadminweb/Cons/const_data.dart';
import 'package:mctvadminweb/modal/EpData.dart';

import 'package:mctvadminweb/modal/series_modal.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  final formkey = GlobalKey<FormState>();

  var movietitlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var movieCoverImgController = TextEditingController();
  var linkcontroller = TextEditingController();
  var countcontroller = TextEditingController();
  var yearcontroller = TextEditingController();
  var studiocontroller = TextEditingController();
  var convertedjson = TextEditingController();

  var totalpost = '0';

  @override
  void initState() {
    super.initState();
  }

  List<SeriesModal> dataList = [];
  List<String> temporaryCategory = [
    'Series',
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
    false,
    false,
    false,
    false,
    false,
  ];

  List<EpData> eplist = [];
  void copytoClipboard() async {
    await Clipboard.setData(ClipboardData(text: convertedjson.text));
  }

  void geteplist() {
    int epcount = int.parse(countcontroller.text.toString());

    for (int i = 1; i <= epcount; i++) {
      String epname = 'ep_$i';
      String eplink =
          'http://www.zegomovie.com/Videos/${linkcontroller.text}$i/index.m3u8';

      eplist.add(EpData(epname, eplink));
    }
  }

  void getList() {
    geteplist();
    var catelist = temporaryCategory.toString();

    var formattedcatelist = catelist.substring(1, catelist.length - 1);

    dataList.add(SeriesModal(
        movietitlecontroller.text,
        descriptioncontroller.text,
        movieCoverImgController.text,
        movieCoverImgController.text,
        yearcontroller.text,
        formattedcatelist,
        studiocontroller.text,
        eplist));
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
    movietitlecontroller.text = '';
    descriptioncontroller.text = '';
    movieCoverImgController.text = '';

    countcontroller.text = '';
    linkcontroller.text = '';
    studiocontroller.text = '';
    yearcontroller.text = '';
    temporaryCategory = [];
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
                                  return "Series Title can't be Empty";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Series Title',
                                  border: OutlineInputBorder())),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                              controller: movieCoverImgController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Series Image can't be Empty";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Series Image',
                                  border: OutlineInputBorder())),
                        ),
                        Row(children: [
                          Expanded(
                            child: Container(
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
                                      labelText: 'Link',
                                      border: OutlineInputBorder())),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: TextFormField(
                                  controller: countcontroller,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Count can't be Empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Count',
                                      border: OutlineInputBorder())),
                            ),
                          ),
                        ]),
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
                        SizedBox(
                          height: 150,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  crossAxisSpacing:
                                      4.0, // Adjust the cross-axis spacing as needed
                                  mainAxisSpacing:
                                      4.0, // Adjust the main-axis spacing as needed
                                  childAspectRatio: 3.0, // A
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
                                              temporaryCategory.add(Const_Data
                                                  .category_list[index]);
                                            } else {
                                              temporaryCategory.remove(
                                                  Const_Data
                                                      .category_list[index]);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
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
                                    eplist = [];
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
