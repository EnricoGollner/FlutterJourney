import 'package:data_visualization_app/shared/routes.dart';
import 'package:data_visualization_app/shared/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                context: context,
                builder: (context) {
                  return const Wrap(
                    children: [
                      ListTile(
                          title: Text('Câmera'), leading: Icon(Icons.camera)),
                      ListTile(
                          title: Text('Galeria'), leading: Icon(Icons.image)),
                    ],
                  );
                },
              );
            },
            child: const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/dog.jpg'),
              ),
              accountName: Text('Enrico'),
              accountEmail: Text('enricogollner.tech@gmail.com'),
            ),
          ),
          const CustomDrawerItem(
            route: homePage,
            label: 'Home',
            icon: Icons.home,
          ),
          const CustomDrawerItem(
            route: registerPage,
            label: 'Register',
            icon: Icons.app_registration_outlined,
          ),
          CustomDrawerItem(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Column(
                      children: [
                        Text('Termos de uso e privacidade', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                        SizedBox(height: 20),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ultricies quam non dolor congue, vel tempus nisi lacinia. Nunc aliquet ex euismod, varius orci id, ultricies metus. Etiam in ante quis leo hendrerit auctor. Curabitur vel sagittis turpis. Mauris semper tellus ut dapibus malesuada. Nam ut arcu ligula. Maecenas turpis justo, viverra eu laoreet ac, ullamcorper ac purus. Etiam quis dui arcu. \nPhasellus consequat at mauris a efficitur. Nullam sem mauris, efficitur et mattis non, vulputate vitae dolor. Vivamus odio leo, imperdiet eget rhoncus at, auctor eget mi. Duis sed efficitur lectus, nec cursus magna. Aenean aliquam at arcu eget auctor. Nunc aliquet purus ac sagittis vehicula. Curabitur tellus est, sodales et molestie id, pulvinar consectetur libero. Vestibulum tincidunt mi est. Phasellus blandit convallis purus, et molestie nunc pellentesque id. In tempor magna vel porta sodales. Curabitur cursus arcu vitae neque aliquam, eu finibus quam vehicula. Vestibulum iaculis nunc vitae turpis consectetur vestibulum. Quisque facilisis egestas purus, at ornare libero suscipit ac.',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            label: 'Termos de Uso e Privacidade',
            icon: Icons.info,
          ),
        ],
      ),
    );
  }
}
