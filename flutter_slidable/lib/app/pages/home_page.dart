import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/user.dart';

enum Actions { share, delete, archive }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Slidable'),
      ),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Slidable(
              key: Key(user.name),
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () => _onDismissed(index, Actions.archive),
                ),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.blue,
                    icon: Icons.archive,
                    label: 'archive',
                    onPressed: (context) =>
                        _onDismissed(index, Actions.archive),
                  ),
                  SlidableAction(
                    backgroundColor: Colors.green,
                    icon: Icons.share,
                    label: 'Share',
                    onPressed: (context) => _onDismissed(index, Actions.share),
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () => _onDismissed(index, Actions.delete),
                ),
                children: [
                  SlidableAction(
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      onPressed: (context) =>
                          _onDismissed(index, Actions.delete))
                ],
              ),
              child: buildUserListTile(user),
            );
          },
        ),
      ),
    );
  }

  void _onDismissed(int index, Actions action) {
    final user = users[index];
    setState(() => users.removeAt(index));

    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${user.name} is deleted', Colors.red);
        break;
      case Actions.share:
        _showSnackBar(context, '${user.name} is shared', Colors.green);
        break;
      case Actions.archive:
        _showSnackBar(context, '${user.name} is archived', Colors.blue);
        break;
    }
  }

  void _showSnackBar(BuildContext context, String msg, Color color) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildUserListTile(User user) => ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(user.image),
        ),
        onTap: () {
          final slidable = Slidable.of(context)!;
          final isClosed = slidable.actionPaneType.value == ActionPaneType.none;

          if (isClosed) {
            slidable.openStartActionPane();
          } else {
            slidable.close();
          }
        },
      );
}
