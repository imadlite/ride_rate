import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ride_rate/models/ride_model.dart';

class RideController extends GetxController with SingleGetTickerProviderMixin {
  final RideModel ride = RideModel(1).obs();
  static const double minValue = 1;
  static const double maxValue = 3;
  Color endcolor = Color(0xffffdada);
  Color startcolor = Color(0xffdaffdb);
  late AnimationController controller;
  late Animation<double> okanimation;
  late Animation<double> badanimation;
  late Animation<double> goodanimation;
  late Animation<double> okeyeball;
  late Animation<double> badeyeball;
  late Animation<double> goodeyeball;
  late Animation containerColor;
  late Animation backgroundColor;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    okanimation = Tween<double>(
      begin: 0.4,
      end: 0.7,
    ).animate(controller);
    badanimation = Tween<double>(
      begin: 0.7,
      end: 0.5,
    ).animate(controller);
    goodanimation = Tween<double>(
      begin: 0.5,
      end: 0.9,
    ).animate(controller);

    badeyeball = Tween<double>(
      begin: 0,
      end: 10,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
    goodeyeball = Tween<double>(
      begin: -10,
      end: -0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
    okeyeball = Tween<double>(
      begin: 0.05,
      end: 0.02,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    containerColor =
        ColorTween(begin: startcolor, end: endcolor).animate(controller);
    backgroundColor = ColorTween(begin: startcolor, end: Color(0xfffa9999))
        .animate(controller);
    controller.forward();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void updateValue(double newValue) {
    ride.value = newValue;
    updateColorTween(newValue);
    controller.reset();
    controller.forward();
  }

  void updateColorTween(double value) {
    if (value < 2) {
      containerColor = ColorTween(begin: const Color(0xffdaffdb), end: endcolor)
          .animate(controller);
      backgroundColor =
          ColorTween(begin: const Color(0xffdaffdb), end: Color(0xfffa9999))
              .animate(controller);
    } else if (value < 3) {
      containerColor =
          ColorTween(begin: endcolor, end: startcolor).animate(controller);
      backgroundColor = ColorTween(
              begin: const Color(0xfffa9999), end: const Color(0xff9dfca1))
          .animate(controller);
    } else if (value < 4) {
      containerColor =
          ColorTween(begin: startcolor, end: const Color(0xffffffd9))
              .animate(controller);
      backgroundColor = ColorTween(
              begin: const Color(0xffffffd9), end: const Color(0xfffaf98b))
          .animate(controller);
    }
  }
}
