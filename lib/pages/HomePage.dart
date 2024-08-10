import 'dart:async'; // Import for Timer
import 'package:devti_test/theme/ProviderSubscription.dart';
import 'package:devti_test/widgets/ButtonHome.dart';
import 'package:devti_test/widgets/ContainerCur.dart';
import 'package:devti_test/widgets/ContainerNoSub.dart';
import 'package:devti_test/widgets/ContainnerNotification.dart';
import 'package:devti_test/widgets/ContinnerUserInfo.dart';
import 'package:devti_test/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = ["logo.png", "math.jpg", "rabbit.jpg"];
  String imageSelected = "logo.png"; // Initialize with a default image
  late Timer _timer; // Timer for image and point updates

  // Active states for the containers
  List<bool> containerActive = [
    true,
    false,
    false
  ]; // Track which container is active

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      changeImage();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void changeImage() {
    setState(() {
      // Cycle through images
      int currentIndex = images.indexOf(imageSelected);
      int nextIndex = (currentIndex + 1) % images.length;
      imageSelected = images[nextIndex];

      // Update active states based on the selected image
      for (int i = 0; i < containerActive.length; i++) {
        containerActive[i] =
            (i == nextIndex); // Set active state for the current image
      }
    });
  }

  void printMessage() {
    print("true");
    Navigator.pop(context);
  }

  void _showAddDeliveryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).primaryColor,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the start
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Close",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context); // Close the current bottom sheet
                              },
                              child: const Icon(Icons.close,
                                  size: 20, // Adjust size as needed
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "add delivery phone number",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the current bottom sheet
                      _showConfirmDeliveryBottomSheet(
                          context); // Open the second bottom sheet
                    },
                    child: const Text(
                      "Send Request",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showConfirmDeliveryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 3,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Close",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context); // Close the current bottom sheet
                          },
                          child: const Icon(Icons.close,
                              size: 20, // Adjust size as needed
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "abdellah",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "xxxxxxxxxxx",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    onPressed: printMessage,
                    child: const Text(
                      "Send Request",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerSubscription = Provider.of<ProviderSubscription>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: HeaderPage(
                    function: () => print("Manage sub"),
                    imageSelected: imageSelected),
              ),
              const SizedBox(height: 2), // Add spacing between sections
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerCur(indexIsActive: containerActive[0]),
                  ContainerCur(indexIsActive: containerActive[1]),
                  ContainerCur(indexIsActive: containerActive[2]),
                ],
              ),
              const SizedBox(height: 20), // Add spacing between buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonHome(
                    function: () => print("manage button"),
                    textValue: "Manage Subscription",
                    bgColor: Colors.white,
                    icon: const Icon(Icons.card_giftcard, color: Colors.black),
                    color: Colors.black,
                    borderColor: Colors.black,
                  ),
                  ButtonHome(
                    function: () {
                      _showAddDeliveryBottomSheet(
                          context); // Show the first bottom sheet
                    },
                    textValue: "Add Delivery",
                    icon: const Icon(Icons.card_giftcard, color: Colors.white),
                    bgColor: const Color.fromARGB(255, 40, 54, 70),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: !providerSubscription.sub
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Activities",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  if (providerSubscription.sub)
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            "Sort By",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.chevronDown,
                            size: 15,
                          ),
                        ],
                      ),
                      onTap: () => _showSortOptionsBottomSheet(context),
                    ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (!providerSubscription.sub) const ContainerNotSub(),
              if (providerSubscription.sub)
                const Column(
                  children: [
                    NotificationPage(
                      codeID: "53738",
                      company: "dev Ti",
                      date: "10:11 PM",
                      imageUser: "assets/logo.png",
                      nameUser: "abdelah",
                      status: "completed",
                    ),
                    ContainerInfo(),
                    ContainerInfo(),
                    ContainerInfo(),
                    ContainerInfo(),
                    ContainerInfo(),
                    ContainerInfo(),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  void _showSortOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the current bottom sheet
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Close",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Icon(Icons.close,
                            size: 20, // Adjust size as needed
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              const ListTile(
                title: Text("Sort by completed"),
              ),
              ListTile(
                title: const Text("Sort by canceled"),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
                },
              ),
              ListTile(
                title: const Text("Sort by date"),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
