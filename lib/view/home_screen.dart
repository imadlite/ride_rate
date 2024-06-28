import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_rate/Controllers/ride_controller.dart';
import 'package:ride_rate/widgets/customPaint.dart';
import 'package:ride_rate/widgets/star_rating.dart';

class HomeScreen extends StatelessWidget {
  final RideController controller = Get.put(RideController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: AnimatedBuilder(
          animation: controller.controller,
          builder: (BuildContext context, Widget? child) {
            return Center(
              child: Stack(
                children: [
                  GetBuilder<RideController>(
                    builder: (_) {
                      return Container(
                        height: size.height,
                        width: size.width,
                        color: controller.backgroundColor.value,
                      );
                    },
                  ),
                  Positioned(
                    top: size.height * 0.015,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize:
                            MaterialStatePropertyAll(Size.fromHeight(50)),
                        iconSize: MaterialStatePropertyAll(35),
                        shape: MaterialStatePropertyAll(CircleBorder()),
                      ),
                      onPressed: () {},
                      child: Icon(Icons.close,
                          color: controller.backgroundColor.value),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: size.width / 2 - 70,
                    child: Text(
                      "Ride Finished",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: ContainerClipper(),
                      child: GetBuilder<RideController>(
                        builder: (_) {
                          return Container(
                            height: size.height * 0.9,
                            decoration: BoxDecoration(
                              color: controller.containerColor.value,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 5,
                    left: size.width * 0.1,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "How was \nyour ride?",
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: Size.fromWidth(200).width,
                          width: Size.fromWidth(200).width,
                          child: CustomPaint(
                            painter: FacePainter(
                              okeyeball: controller.okeyeball.value,
                              goodeyeball: controller.goodeyeball.value,
                              badeyeball: controller.badeyeball.value,
                              expressionValue: controller.ride.value.toDouble(),
                              okvalue: controller.okanimation.value,
                              badvalue: controller.badanimation.value,
                              goodvalue: controller.goodanimation.value,
                            ),
                          ),
                        ),
                        GetBuilder<RideController>(
                          builder: (_) {
                            return Text(
                              controller.ride.expression,
                              style: GoogleFonts.poppins(fontSize: 20),
                            );
                          },
                        ),
                        SizedBox(
                          width: 300,
                          child: GetBuilder<RideController>(
                            builder: (_) {
                              return StarRating(
                                rating: controller.ride.value.toInt(),
                                color: controller.backgroundColor.value,
                                maxRating: 3,
                                onRatingChanged: (newRating) {
                                  controller.updateValue(newRating.toDouble());
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.04,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Image.asset(
                        //       "assets/icon.png",
                        //       height: 30,
                        //     ),
                        //     const SizedBox(width: 20),
                        //     Text(
                        //       "Add a comment",
                        //       style: GoogleFonts.poppins(fontSize: 18),
                        //     ),
                        //   ],
                        // ),

                        const SizedBox(height: 30),
                        CupertinoButton(
                          color: Colors.black,
                          child: const Text("Done"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
