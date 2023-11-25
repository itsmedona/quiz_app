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
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: score),
        ),
      );
    } else {
      quest_no == quest_no + 1;
    }
    setState(() {});
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
        elevation: 10,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("${quest_no + 1}/10")],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                DataBase.myData[quest_no]["question"],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 75,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // print(index);
                      value = index;
                      if (index == DataBase.myData[quest_no]["answer"]) {
                        score = score + 1;
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: value == index
                            ? value == DataBase.myData[index]['answer']
                                ? Colors.green
                                : Colors.red
                            : Colors.amber,
                      ),
                      height: 50,
                      width: 300,
                      child: Center(
                          child: Text(
                        DataBase.myData[quest_no]['options'][index],
                        style: TextStyle(
                            color: Colors.white12,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
                itemCount: 4,
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      previous();
                    },
                    child: Text("<-- Previous"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counter();
                      value = 5;
                      setState(() {});
                    },
                    child: const Text("Next --> "),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
