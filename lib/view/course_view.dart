import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/appStyle.dart';

class TheCoursesScreen extends StatelessWidget {
  const TheCoursesScreen({super.key});

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
              _theAppBar(width, height),
              _theProgressIndicator(height),
              Expanded(child: WebDevStepper()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _theAppBar(double width, double height) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * .09,
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
                        onPressed: () {},
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
                        Text("Web dev",
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

  Widget _theProgressIndicator(double height) {
    return Stack(
      children: [
        LinearProgressIndicator(
          color: AppStyles.greenColor,
          backgroundColor: AppStyles.grayColor,
          value: 70 / 100,
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

class WebDevStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Consumer<StepperState>(
      builder: (context, stepperState, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Theme(
                  data: ThemeData(
                    primaryColor: AppStyles
                        .greenColor, // This will affect the active step's color
                    colorScheme: ColorScheme.light(
                      primary: AppStyles
                          .greenColor, // Primary color for various elements
                      secondary: AppStyles
                          .grayColor, // Secondary color for progress indicators
                    ),
                  ),
                  child: Stepper(
                    currentStep: stepperState.currentStep,
                    onStepContinue: null, // Remove the continue button action
                    onStepCancel: null, // Remove the cancel button action
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      // Empty builder to remove the buttons
                      return SizedBox
                          .shrink(); // This removes the buttons entirely
                    },
                    steps: [
                      Step(
                        title: Container(
                            padding: EdgeInsets.only(left: 16.0),
                            width: double.maxFinite,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: AppStyles.greenColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Intro to Web Dev",
                                style: AppStyles.medium20(AppStyles.whiteColor),
                              ),
                            )),
                        content: Container(),
                        isActive: stepperState.currentStep >= 0,
                        state: StepState.complete,
                      ),
                      Step(
                        title: Container(
                            margin: EdgeInsets.only(top: 16.0),
                            padding: EdgeInsets.only(left: 16.0),
                            width: double.maxFinite,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: AppStyles.yellowColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "HTML",
                                style: AppStyles.medium20(AppStyles.blackColor),
                              ),
                            )),
                        content: Container(),
                        isActive: stepperState.currentStep >= 1,
                        state: StepState.indexed,
                      ),
                      Step(
                        title: Container(
                            margin: EdgeInsets.only(top: 16.0),
                            padding: EdgeInsets.only(left: 16.0),
                            width: double.maxFinite,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: AppStyles.grayColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "CSS",
                                style: AppStyles.medium24(
                                    AppStyles.blackColor.withOpacity(0.7)),
                              ),
                            )),
                        content: Container(),
                        isActive: stepperState.currentStep >= 2,
                        state: StepState.indexed,
                      ),
                      Step(
                        title: Container(
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.only(left: 16.0),
                            width: double.maxFinite,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: AppStyles.grayColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "JavaScript",
                                style: AppStyles.medium24(
                                    AppStyles.blackColor.withOpacity(0.7)),
                              ),
                            )),
                        content: Container(),
                        isActive: stepperState.currentStep >= 3,
                        state: StepState.indexed,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Logic for the Continue button
                  },
                  child: Text(
                    'Continue',
                    style: AppStyles.semiBold32(AppStyles.whiteColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    minimumSize: Size(double.infinity, height * 0.1),
                    backgroundColor: AppStyles.greenColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _theCourseCard(
      double height, String text, Color textColor, Color backgroundColor) {
    return Container(
        margin: EdgeInsets.only(top: 16.0),
        padding: EdgeInsets.only(left: 16.0),
        width: double.maxFinite,
        height: height * 0.1,
        decoration: BoxDecoration(
            color: AppStyles.yellowColor,
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "HTML",
            style: AppStyles.medium20(AppStyles.blackColor),
          ),
        ));
  }
}
