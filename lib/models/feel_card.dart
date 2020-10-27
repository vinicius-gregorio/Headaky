import 'package:flutter/material.dart';
import 'package:headaky/models/activity_icon.dart';

class FeelCard extends StatefulWidget {
  final String dateTime;
  final String feel;
  final String image;
  final List<String> activitiesName;
  final List<String> activitiesImage;
  final List<String> foodsName;
  final List<String> foodsImage;

  const FeelCard(this.dateTime, this.feel, this.image, this.activitiesName,
      this.activitiesImage, this.foodsName, this.foodsImage);

  @override
  _FeelCardState createState() => _FeelCardState();
}

class _FeelCardState extends State<FeelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListTile(
        leading: Column(
          children: [Image.asset(widget.image), Text(widget.feel)],
        ),
        title: Column(
          children: [
            Container(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.activitiesImage.length,
                  itemBuilder: (_, index) {
                    return Row(
                      children: [
                        ActivityIcon(widget.activitiesImage[index],
                            widget.activitiesName[index], Colors.transparent)
                      ],
                    );
                  }),
            ),
            Container()
          ],
        ),
        trailing: null,
      ),
    );
  }
}

// import '../db/db_helper.dart';
// import 'activity.dart';
// import 'food.dart';

// class FeelCard extends ChangeNotifier {
//   String dateTime;
//   String feel;
//   List<String> activitynames = [];
//   List<String> activityimages = [];
//   List<String> foodNames = [];
//   List<String> foodImages = [];
//   String image;
//   String actImage;
//   String actName;
//   String foodImage;
//   String foodName;

//   FeelCard(
//       {this.dateTime,
//       this.feel,
//       this.activitynames,
//       this.activityimages,
//       this.image,
//       this.actImage,
//       this.actName,
//       this.foodImage,
//       this.foodName});

//   List items;

//   String date;
//   bool isloading = false;

//   void addActivity(Activity act) {
//     activityimages.add(act.image);
//     activitynames.add(act.name);
//     notifyListeners();
//     print(activitynames);
//   }

//   void addFood(Food food) {
//     foodNames.add(food.image);
//     foodImages.add(food.image);
//   }

//   void printParameter(String param) {
//     print(param);
//   }

//   notifyListeners();

//   Future<void> addPlace(
//       String dateTime,
//       String feel,
//       String image,
//       String actImage,
//       String actName,
//       String foodImage,
//       String foodName,
//       String date) async {
//     DBHelper.insertFeel('user_feels', {
//       'datetime': dateTime,
//       'feel': feel,
//       'image': image,
//       'actimage': actImage,
//       'actname': actName,
//       'foodimage': foodImage,
//       'foodname': foodName,
//       'date': date
//     });
//     notifyListeners();
//   }

//   Future<void> deletePlaces() async {
//     DBHelper.delete(dateTime);
//     notifyListeners();
//   }
// }
