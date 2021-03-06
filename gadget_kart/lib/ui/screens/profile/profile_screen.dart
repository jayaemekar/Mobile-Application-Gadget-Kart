import 'package:flutter/material.dart';
import './add_product.dart';
import './address_screen.dart';
import './favorite_screen.dart';
import './user_info.dart';

class ProfileScreen extends StatefulWidget {
  static const id = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WelCome",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CardPageItem(
            icon: Icons.location_on,
            title: "Address",
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, AddressScreen.id);
            },
          ),
          CardPageItem(
            icon: Icons.manage_accounts,
            title: "Edit Profile",
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, UserInfo.id);
            },
          ),
          CardPageItem(
            icon: Icons.favorite,
            title: "Favorite",
            color: Colors.purple,
            onPressed: () {
              Navigator.pushNamed(context, FavoriteScreen.id);
            },
          ),
           CardPageItem(
             icon: Icons.upload,
             title: "Upload Product",
             color: Colors.blue,
             onPressed: () {
               Navigator.pushNamed(context, UploadProductForm.id);
             },
           ),
        ],
      ),
    );
  }
}

class CardPageItem extends StatelessWidget {
  const CardPageItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onPressed})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(title),
        trailing: const Icon(Icons.double_arrow),
      ),
    );
  }
}
