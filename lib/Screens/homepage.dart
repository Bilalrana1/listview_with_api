import 'package:flutter/material.dart';
import 'package:listview_with_api/services/user_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List users = [];
  @override
  void initState() {
    super.initState();
    getuserlist();
  }

  getuserlist() async {
    var uSers = await getusers();
    setState(() {
      users = uSers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact list"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(240, 246, 221, 0),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        //color: const Color.fromARGB(151, 243, 210, 210),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int item) => const Divider(
            color: Color.fromARGB(255, 255, 1, 1),
          ),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            var user = users[index];
            return ListTile(
              title: Text(user["name"]["first"] + ' ' + user["name"]["last"]),
              subtitle: Text(user["email"]),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user["picture"]["medium"]),
              ),
            );
          },
        ),
      ),
    );
  }
}
