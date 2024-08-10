import 'package:flutter/material.dart';
import 'package:devti_test/models/NotModel.dart';
import 'package:devti_test/models/rootBundle.dart';
import 'package:devti_test/widgets/ContainnerNotification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String _sortOption = 'completed'; // Default sort option

  Future<List<NotModel>> _loadAndSortNotModels() async {
    List<NotModel> notModels = await loadNotModels();
    switch (_sortOption) {
      case 'completed':
        notModels
            .sort((a, b) => b.status.compareTo(a.status)); // Sort by status
        break;
      case 'cancel':
        notModels.sort((a, b) =>
            a.status.compareTo(b.status)); // Sort by status (cancel first)
        break;
      case 'date':
        notModels.sort((a, b) => b.date.compareTo(a.date)); // Sort by date
        break;
      default:
        break;
    }
    return notModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context); // Navigate back to the previous page
                  },
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        size: 15,
                        // color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Back",
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                ),
                Text(
                  "Notifications",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Show bottom menu for sorting options
                    showModalBottomSheet(
                      backgroundColor: Theme.of(context).primaryColor,
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Sort by",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Close",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context); // Close the current bottom sheet
                                            },
                                            child: const Icon(Icons.close,
                                                size:
                                                    20, // Adjust size as needed
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                width: MediaQuery.sizeOf(context).width,
                                height: 2,
                                color: Colors.black,
                              ),
                              ListTile(
                                title: Text(
                                  "Sort by completed",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                onTap: () {
                                  setState(() {
                                    _sortOption = 'completed';
                                  });
                                  Navigator.pop(context); // Close bottom sheet
                                },
                              ),
                              ListTile(
                                title: Text(
                                  "Sort by cancel",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                onTap: () {
                                  setState(() {
                                    _sortOption = 'cancel';
                                  });
                                  Navigator.pop(context); // Close bottom sheet
                                },
                              ),
                              ListTile(
                                title: Text(
                                  "Sort by date",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                onTap: () {
                                  setState(() {
                                    _sortOption = 'date';
                                  });
                                  Navigator.pop(context); // Close bottom sheet
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<NotModel>>(
              future: _loadAndSortNotModels(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No notifications found'));
                } else {
                  final notModels = snapshot.data!;
                  return ListView.builder(
                    itemCount: notModels.length,
                    itemBuilder: (context, index) {
                      final notModel = notModels[index];
                      return NotificationPage(
                        codeID: notModel.codeID,
                        company: notModel.company,
                        date: notModel.date,
                        imageUser: notModel.imageUser,
                        nameUser: notModel.nameUser,
                        status: notModel.status,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
