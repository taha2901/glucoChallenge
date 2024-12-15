import 'package:challenge/core/theming/styles.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// ignore: must_be_immutable
class DefineInReservation extends StatelessWidget {
  final DoctorResponseBody? doctorResponseBody;
  const DefineInReservation({
    super.key,
    this.doctorResponseBody,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      borderOnForeground: true,
      shadowColor: Colors.blue[100],
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.011),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4B82DC),
                    Color(0xffE3EDFD),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // color: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.015),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.011),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '     ',
                          ),
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.07,
                            backgroundImage: NetworkImage(
                              doctorResponseBody!.photo,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.03,
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.005),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),
                      Center(
                        child: Text(doctorResponseBody!.userName,
                            style: TextStyles.font18WhiteBold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.3),
                            color: Colors.blue),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: const Icon(
                            Iconsax.coin,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'السعر',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    doctorResponseBody!.detectionPrice.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.3),
                            color: Colors.blue),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.account_box_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'الخبره',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    doctorResponseBody!.doctorspecialization.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.3),
                            color: Colors.blue),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Iconsax.location,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'الموقع',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    doctorResponseBody!.address.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
