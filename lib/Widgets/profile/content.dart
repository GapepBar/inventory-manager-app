// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, file_names, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:about/about.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Content extends ConsumerStatefulWidget {
  Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends ConsumerState<Content> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  void navigation(context, naviUrl) {
    Navigator.of(context).pushNamed('$naviUrl');
  }

  Widget iconRow(icn, text, context, naviUrl, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (naviUrl == 'about') {
          showAboutPage(
            context: context,
            values: {
              'version': '1.0',
              'year': DateTime.now().year.toString(),
            },
            applicationLegalese: 'Copyright © ADPS, {{ year }}',
            applicationDescription: const ReadMoreText(
              trimLines: 4,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              trimCollapsedText: '\nRead more >>',
              trimExpandedText: '\nShow less <<',
              'Basko is a cutting-edge grocery delivery app that allows users to order their groceries in real time and have them delivered straight to their doorstep. With a user-friendly interface and a vast selection of fresh, high-quality products, Basko makes grocery shopping easier and more convenient than ever before. Whether you need to stock up on pantry essentials, fresh produce, or household items, Basko offers a seamless shopping experience that saves you time and energy. With its reliable and efficient delivery system, Basko is the perfect solution for busy individuals who want to enjoy the convenience of shopping from the comfort of their own homes.',
            ),
            children: const <Widget>[
              MarkdownPageListTile(
                icon: Icon(Icons.list),
                title: Text('Changelog'),
                filename: 'CHANGELOG.md',
              ),
              LicensesPageListTile(
                icon: Icon(Icons.favorite),
              ),
            ],
            applicationIcon: SizedBox(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Logo%2FNew%2Flogo%20png%202.png?alt=media&token=c9f57ebd-d2e6-402b-8844-3758029d9258'),
            ),
          );
        } else if (naviUrl == 'logout') {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    await logout();

                    Navigator.pop(context, 'Logout');
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/loginpage', (Route<dynamic> route) => false);
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        } else {
          navigation(context, naviUrl);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                margin: const EdgeInsets.only(right: 9),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white38,
                  foregroundColor: Theme.of(context).primaryColor,
                  child: FaIcon(
                    icn,
                    size: 17,
                  ),
                ),
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ]),
            Container(
                margin: const EdgeInsets.only(right: 5),
                child: const Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'YOUR INFORMATION',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 121, 117, 117)),
            ),
            const SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.shoppingBag, 'Your Settled Orders',
                context, '/yourSettledOrderScreen', ref),
          ]),
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'OTHER INFORMATION',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 121, 117, 117)),
                )),
            const SizedBox(
              height: 12,
            ),
            iconRow(FontAwesomeIcons.info, 'About us', context, 'about', ref),
            const SizedBox(
              height: 3,
            ),
            iconRow(FontAwesomeIcons.rightFromBracket, 'Logout', context,
                'logout', ref),
          ]),
        ),
      ],
    );
  }
}
