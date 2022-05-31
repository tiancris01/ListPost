import 'package:flutter/material.dart';

import 'Data/User_model.dart';
import 'Data/post_model.dart';
import 'Domain/repository.dart';
import 'Presentation/user_details_page.dart';

// This is the main, the roof of the App
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: Posts(),
    );
  }
}

// Class Post, In this class we fetch the Json Data and parce it
class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final List<Post> _post = <Post>[];
  final List<Post> _postCopy = <Post>[];
  bool empty = false;
  final List<User> _user = <User>[];
  final Set<Post> _saved = <Post>{};
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();

    fetchUser().then((value) {
      _user.addAll(value);
    });

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
                if (empty) {
                  _post.addAll(_postCopy);
                  empty = false;
                  setState(() {});
                }
              }),
        ],
      ),
      body: _postListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _post.clear();
          _saved.clear();
          empty = true;
          setState(() {});
        },
        child: const Icon(Icons.delete),
      ),
    );
  }

// Coustome List View
  Widget _postListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _user.length,
        itemBuilder: (context, i) {
          if (empty) {
            return Container();
          } else {
            return _coustomeListTile(_post[i], _user[i]);
          }
        });
  }

  Widget _coustomeListTile(Post post, User user) {
    final bool alreadySaved = _saved.contains(post);
    IconData icon1 = Icons.star_border;
    IconData icon2 = Icons.star;
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(child: Text('${post.id}')),
          title: Text(post.title),
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
                  padding: EdgeInsets.only(right: 8.0),
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
                  title: Text(
                    post.title,
                    style: _biggerFont,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_double_arrow_left_sharp,
                    color: Colors.red,
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
