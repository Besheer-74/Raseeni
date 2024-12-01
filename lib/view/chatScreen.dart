import 'package:flutter/material.dart';
import 'package:raseeni/model/appStyle.dart';
import 'view_chat_screen.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> theData = [
      {
        'title': 'Kotlin Community',
        'title_color': AppStyles.whiteColor,
        'the_color': AppStyles.maybeCyan,
        'the_image': '',
        'notification_count': 9,
      },
      {
        'title': 'Web dev Community',
        'title_color': AppStyles.blackColor,
        'the_color': AppStyles.yellowColor,
        'the_image': '',
        'notification_count': null,
      },
      {
        'title': 'Python Community',
        'title_color': AppStyles.whiteColor,
        'the_color': AppStyles.greenColor,
        'the_image': '',
        'notification_count': null,
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: GridView.builder(
            itemCount: theData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewChatScreen(
                            // title: theData[index]['title'],
                            // theColor: theData[index]['the_color'],
                            ))),
                child: TheChatItem(
                    theItemColor: theData[index]['the_color'],
                    theTextColor: theData[index]['title_color'],
                    theTitle: theData[index]['title'],
                    theImage: theData[index]['the_image'],
                    notificationCount: theData[index]['notification_count']),
              );
            }),
      ),
    );
  }
}

class TheChatItem extends StatelessWidget {
  Color theItemColor;
  Color theTextColor;
  String theTitle;
  String theImage;
  int? notificationCount;
  TheChatItem(
      {super.key,
      required this.theItemColor,
      required this.theTextColor,
      required this.theTitle,
      required this.theImage,
      required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    double height;
    double width = MediaQuery.of(context).size.width;
    width = width - 48;
    width = width / 2;
    height = width * 1.2;
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.546,
                width: width,
                decoration: BoxDecoration(
                    color: AppStyles.grayColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      (notificationCount == null)
                          ? Container()
                          : Container(
                              decoration: BoxDecoration(
                                  color: AppStyles.orangeColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Text(
                                notificationCount.toString(),
                                style:
                                    AppStyles.semiBold12(AppStyles.whiteColor),
                              )),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            height: height * (1 / 4),
            width: width,
            decoration: BoxDecoration(
                color: theItemColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    theTitle,
                    style: AppStyles.semiBold12(AppStyles.whiteColor),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
