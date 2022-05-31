import 'package:flutter/material.dart';
import 'package:zemoga_test/Presentation/widgets/custom_text..dart';
import 'package:zemoga_test/Presentation/widgets/titel_widget.dart';

import '../../Data/User_model.dart';
import '../../Data/post_model.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  final User user;

  const PostDetailsPage({
    Key? key,
    required this.post,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('${userTitle()} ${user.firstName} ${user.lastName}'),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTitle(titleTxt: 'Description'),
                      CustomText(textTxt: post.body)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CustomTitle(titleTxt: 'Name: '),
                            CustomText(textTxt: user.name),
                          ],
                        ),
                        Row(
                          children: [
                            const CustomTitle(titleTxt: 'UserName: '),
                            CustomText(textTxt: user.username),
                          ],
                        ),
                        Row(
                          children: [
                            const CustomTitle(titleTxt: 'Email: '),
                            CustomText(textTxt: user.email),
                          ],
                        ),
                        Row(
                          children: [
                            const CustomTitle(titleTxt: 'Phone: '),
                            CustomText(textTxt: user.phone),
                          ],
                        )
                      ]),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: CustomText(textTxt: post.body),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
