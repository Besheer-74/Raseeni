import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/controller/app_user_controller.dart';
import 'package:raseeni/model/course_item_model.dart';

import '../model/appStyle.dart';

class TheCoursesScreen extends StatelessWidget {
  final List<CourseItem> theCourseItems;
  final String courseId;
  final String courseName;
  const TheCoursesScreen(
      {super.key,
      required this.theCourseItems,
      required this.courseName,
      required this.courseId});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return ChangeNotifierProvider(
      create: (context) => StepperState(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _theAppBar(width, height, courseName, context),
              _theProgressIndicator(height, context),
              Expanded(
                  child: WebDevStepper(
                theCourseItems: theCourseItems,
                courseId: courseId,
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _theAppBar(
      double width, double height, String title, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * .12,
          decoration: BoxDecoration(
            color: AppStyles.yellowColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          AppStyles.back,
                          color: AppStyles.blackColor,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(courseName,
                            style: AppStyles.semiBold24(AppStyles.blackColor)),
                        Text("Master Class",
                            style: AppStyles.regular24(AppStyles.blackColor))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Image.asset(
                  width: width * 0.12,
                  AppStyles.web,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _theProgressIndicator(double height, BuildContext context) {
    return Consumer<AppUser>(builder: (context, myProvider, child) {
      return Stack(
        children: [
          LinearProgressIndicator(
            color: AppStyles.greenColor,
            backgroundColor: AppStyles.grayColor,
            value: myProvider.getProgress(myProvider.myCoursesList[0].id) / 100,
            minHeight: height * 0.045,
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    color: AppStyles.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppStyles.grayColor,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, -4),
                      )
                    ]),
              ),
            ],
          ),
        ],
      );
    });
  }
}

class StepperState with ChangeNotifier {
  int _currentStep = 0;
  int _progress = 45;

  int get currentStep => _currentStep;
  int get progress => _progress;

  void nextStep() {
    if (_currentStep < 3) {
      _currentStep++;
      // Adjust progress dynamically based on the step
      if (_currentStep == 1) {
        _progress = 45; // Update the progress when moving to HTML
      } else if (_currentStep == 2) {
        _progress = 70; // Update the progress when moving to CSS
      } else if (_currentStep == 3) {
        _progress = 100; // Final progress
      }
      notifyListeners();
    }
  }

  void prevStep() {
    if (_currentStep > 0) {
      _currentStep--;
      // Adjust progress accordingly when going backward
      if (_currentStep == 0) {
        _progress = 0;
      } else if (_currentStep == 1) {
        _progress = 45;
      }
      notifyListeners();
    }
  }
}

// class WebDevStepper extends StatelessWidget {
//   final List<CourseItem> theCourseItems;
//   final String courseId;
//   const WebDevStepper(
//       {super.key, required this.theCourseItems, required this.courseId});

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double width = size.width;
//     final double height = size.height;
//     var stepperState = Provider.of<StepperState>(context);
//     return Consumer<AppUser>(
//       builder: (context, user, child) {
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Theme(
//                   data: ThemeData(
//                     primaryColor: AppStyles
//                         .greenColor, // This will affect the active step's color
//                     colorScheme: ColorScheme.light(
//                       primary: AppStyles
//                           .greenColor, // Primary color for various elements
//                       secondary: AppStyles
//                           .grayColor, // Secondary color for progress indicators
//                     ),
//                   ),
//                   child: Stepper(
//                     currentStep: stepperState.currentStep,
//                     onStepContinue: null, // Remove the continue button action
//                     onStepCancel: null, // Remove the cancel button action
//                     controlsBuilder:
//                         (BuildContext context, ControlsDetails details) {
//                       // Empty builder to remove the buttons
//                       return SizedBox
//                           .shrink(); // This removes the buttons entirely
//                     },
//                     steps: List.generate(
//                       theCourseItems.length,
//                       (index) {
//                         return Step(
//                           title: Container(
//                               margin: EdgeInsets.only(top: 16.0),
//                               padding: EdgeInsets.only(
//                                 left: 16.0,
//                               ),
//                               width: double.maxFinite,
//                               height: height * 0.15,
//                               decoration: BoxDecoration(
//                                   color: AppStyles.greenColor,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35))),
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   theCourseItems[index].title,
//                                   style:
//                                       AppStyles.medium20(AppStyles.whiteColor),
//                                 ),
//                               )),
//                           content: Container(),
//                           isActive: stepperState.currentStep >= 0,
//                           state: StepState.complete,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Logic for the Continue button
//                   },
//                   child: Text(
//                     'Continue',
//                     style: AppStyles.semiBold32(AppStyles.whiteColor),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(35)),
//                     minimumSize: Size(double.infinity, height * 0.1),
//                     backgroundColor: AppStyles.greenColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _theCourseCard(
//       double height, String text, Color textColor, Color backgroundColor) {
//     return Container(
//         margin: EdgeInsets.only(top: 16.0),
//         padding: EdgeInsets.only(left: 16.0),
//         width: double.maxFinite,
//         height: height * 0.1,
//         decoration: BoxDecoration(
//             color: AppStyles.yellowColor,
//             borderRadius: BorderRadius.all(Radius.circular(35))),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "HTML",
//             style: AppStyles.medium20(AppStyles.blackColor),
//           ),
//         ));
//   }
// }

class WebDevStepper extends StatelessWidget {
  final List<CourseItem> theCourseItems;
  final String courseId;

  const WebDevStepper(
      {super.key, required this.theCourseItems, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final stepperState = Provider.of<StepperState>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                primaryColor: AppStyles.greenColor,
                colorScheme: ColorScheme.light(
                  primary: AppStyles.greenColor,
                  secondary: AppStyles.grayColor,
                ),
              ),
              child: Stepper(
                physics: const ClampingScrollPhysics(), // Allow scrolling
                currentStep: stepperState.currentStep,
                onStepTapped: (step) {
                  stepperState._currentStep = step;
                  stepperState.notifyListeners(); // Update stepper state
                },
                onStepContinue: () => stepperState.nextStep(),
                onStepCancel: () => stepperState.prevStep(),
                controlsBuilder: (context, details) {
                  // Remove the default buttons
                  return const SizedBox.shrink();
                },
                steps: List.generate(
                  theCourseItems.length,
                  (index) => Step(
                    title: Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      padding: const EdgeInsets.only(left: 16.0),
                      width: double.infinity,
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        color: stepperState.currentStep == index
                            ? AppStyles.greenColor
                            : AppStyles.grayColor, // Dynamic color
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          theCourseItems[index].title,
                          style: AppStyles.regular14(AppStyles.whiteColor),
                        ),
                      ),
                    ),
                    content: Container(), // Empty for now
                    isActive: stepperState.currentStep >= index,
                    state: stepperState.currentStep > index
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                stepperState.nextStep();
              },
              child: Text(
                'Continue',
                style: AppStyles.semiBold32(AppStyles.whiteColor),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                minimumSize: Size(double.infinity, height * 0.1),
                backgroundColor: AppStyles.greenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
