// Class Post, In this class we fetch the Json Data and parce it
import 'package:flutter/material.dart';
import 'package:zemoga_test/Data/User_model.dart';
import 'package:zemoga_test/Data/post_model.dart';
import 'package:zemoga_test/Presentation/screens/user_details_page.dart';
import 'package:zemoga_test/Presentation/widgets/custom_text..dart';

import '../../Domain/repository.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final List<Post> _post = <Post>[];
  final List<Post> _postCopy = <Post>[];
  bool isEmpty = false;
  final List<User> _user = <User>[];
  final Set<Post> _saved = <Post>{};

  @override
  void initState() {
    super.initState();

    //storage _user data
    fetchUser().then((value) {
      _user.addAll(value);
    });
    //storage _post data and calling setState
    fetchPosts().then((value) {
      setState(() {
        _post.addAll(value);
        _postCopy.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.star), onPressed: _pushSaved),
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                if (isEmpty) {
                  _post.addAll(_postCopy);
                  isEmpty = false;
                  setState(() {});
                }
              }),
        ],
      ),
      body: _postListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: clearList,
        child: const Icon(Icons.delete),
      ),
    );
  }

  void clearList() {
    _post.clear();
    _saved.clear();
    isEmpty = true;
    setState(() {});
  }

// ListView
  Widget _postListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _user.length,
        itemBuilder: (context, i) {
          if (isEmpty) {
            return Container();
          } else {
            return _coustomeListTile(_post[i], _user[i]);
          }
        });
  }

  // Custom ListTile
  Widget _coustomeListTile(Post post, User user) {
    final bool alreadySaved = _saved.contains(post);
    IconData icon1 = Icons.star_border;
    IconData icon2 = Icons.star;
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 0, 126, 228),
            child: Text(
              '${post.id}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          title: CustomText(textTxt: post.title),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PostDetailsPage(post: post, user: user)));
          },
          trailing: IconButton(
              icon: alreadySaved ? Icon(icon2) : Icon(icon1),
              onPressed: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(post);
                  } else {
                    _saved.add(post);
                  }
                });
              },
              color: alreadySaved ? Colors.red : null),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }

  //Favorite Page
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<Dismissible> tiles = _saved.map(
            (Post post) {
              return Dismissible(
                key: Key('$post.id'),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  _saved.remove(post);
                  setState(() {});
                },
                background: Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  color: Colors.red,
                  child: const Align(
                    child: Text(
                      'Delete Favorite',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(child: Text('${post.id}')),
                  title: CustomText(
                    textTxt: post.title,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_double_arrow_left_sharp,
                    color: Color.fromARGB(255, 243, 170, 166),
                  ),
                  // color: alreadySaved ? Colors.red : null),
                ),
              );
            },
          );

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
            color: Colors.blue,
          ).toList();
          return Scaffold(
              appBar: AppBar(
                title: const Text('Favorite       <-Move to delete'),
              ),
              body: ListView(children: divided));
        },
      ),
    );
  }
}
