import 'package:flutter/material.dart';
import 'package:quiz_app/utils/database/database.dart';
import 'package:quiz_app/view/ResultPage/ResultPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionno = 0;
  int checkvalue = 0;
  int score = 0;
  void counter() {
    if (questionno == DataBase.myData.length - 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(score: score),
          ));
    } else {
      questionno = questionno + 1;
    }
    setState(() {});
    print(questionno);
  }

  void previous() {
    if (questionno > 0) {
      questionno--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Qwiz...!!"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Text(
                    DataBase.myData[questionno]["question"],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Text(questionno.toString()),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.only(left: 50, bottom: 20, right: 50),
                  child: InkWell(
                    onTap: () {
                      if (index == DataBase.myData[questionno]["answer"]) {
                        score++;
                      }

                      print(index);
                      checkvalue = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          color: checkvalue == index
                              ? checkvalue ==
                                      DataBase.myData[questionno]["answer"]
                                  ? Colors.green
                                  : Colors.red
                              : Colors.amber),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text(DataBase.myData[questionno]["options"][index]),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          previous();
                        },
                        child: Text("Previous")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        counter();
                        checkvalue = 5;
                        setState(() {});
                      },
                      child: Text("Next")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
