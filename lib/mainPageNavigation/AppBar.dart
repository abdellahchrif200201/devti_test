import 'package:devti_test/pages/NotifactionPage.dart';
import 'package:devti_test/theme/ProviderSubscription.dart';
import 'package:devti_test/widgets/ButtonHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyappBar extends StatelessWidget implements PreferredSizeWidget {
  const MyappBar({super.key});

  @override
  Widget build(BuildContext context) {
    final providerSubscription = Provider.of<ProviderSubscription>(context);
    return AppBar(
      backgroundColor: Theme.of(context).cardColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      toolbarHeight: 90,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              // bottomLeft: Radius.circular(10),
              // bottomRight: Radius.circular(10),
              ),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 40, left: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 20),
                  child: Row(
                    children: [
                      ButtonHome(
                        function: () => providerSubscription
                            .setsub(!providerSubscription.sub),
                        textValue: providerSubscription.sub
                            ? "Unsubscribe"
                            : "Subscribe to start",
                        bgColor: providerSubscription.sub
                            ? Theme.of(context).backgroundColor
                            : Theme.of(context).cardColor,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      const SizedBox(width: 8), // Add spacing between texts
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsPage()),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(90); // Adjusted to match toolbarHeight
}
