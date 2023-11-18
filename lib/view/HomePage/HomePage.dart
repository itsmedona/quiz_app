

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/database/database.dart';
import 'package:quiz_app/view/ResultPage/ResultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quest_no = 0;
  int value = 0;
  int score = 0;

  void counter() {
    if (quest_no == DataBase.myData.length - 1) {
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => ResultPage(score: score)),
      );
    } else {
      quest_no == quest_no + 1;
    }
    setState(() {});
    print(quest_no);
  }

  void previous() {
    if (quest_no > 0) {
      quest_no--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QwizB"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // print(index);
                        value = index;
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        color: value == index
                            ? value == DataBase.myData[index]['answer']
                                ? Colors.green
                                : Colors.red
                            : Colors.amber,
                        child: Center(
                            child: Text(DataBase.myData[0]['options'][index])),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    )),
            Text(value.toString()),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  counter();
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }
}
