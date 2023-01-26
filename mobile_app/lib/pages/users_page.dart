/* flutter */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/* models */
import 'package:mobile_app/models/user.dart';
/* services */
import 'package:mobile_app/services/auth_service.dart';
import 'package:mobile_app/services/socket_service.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final List<User> users = [
    User(
      id: '1',
      name: 'José Moncada',
      email: 'jose.moncada@mail.com',
      online: true,
    ),
    User(
      id: '2',
      name: 'Siegfried Moncada',
      email: 'siegfried.moncada@mail.com',
      online: true,
    ),
    User(
      id: '3',
      name: 'Jeorge Gutierrez',
      email: 'jeorge.gutierrez@mail.com',
      online: false,
    ),
    User(
      id: '4',
      name: 'Sara Corrales',
      email: 'sara.corrales@mail.com',
      online: false,
    ),
  ];

  final _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    users.add(
      User(
        id: '5',
        name: 'Ashley López',
        email: 'ashley.lopez@mail.com',
        online: true,
      ),
    );

    if (mounted) setState(() {});

    _refreshController.refreshCompleted();
    /* _refreshController.refreshFailed(); */
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.bg,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.black54,
            ),
            onPressed: () async {
              await authService.signOut();

              socketService.disconnect();

              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
          title: Text(authService.user?.name ?? '',
              style: const TextStyle(
                color: Colors.black54,
              )),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: Icon(
                socketService.serverStatus == ServerStatus.online
                    ? Icons.check_circle
                    : Icons.offline_bolt,
                color: socketService.serverStatus == ServerStatus.online
                    ? Palette.primary
                    : Palette.accent,
              ),
            )
          ],
        ),
        backgroundColor: Palette.bg,
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((_, index) => _user(users[index])),
            separatorBuilder: ((_, index) => const Divider()),
            itemCount: users.length,
          ),
        ),
      ),
    );
  }

  ListTile _user(User user) => ListTile(
        leading: CircleAvatar(
          backgroundColor: user.online ? Palette.primary : Palette.accent,
          child: Text(
            user.name.substring(0, 2),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: user.online ? Palette.primary : Palette.accent,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }
}
