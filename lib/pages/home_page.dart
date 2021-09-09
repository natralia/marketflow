import 'package:flutter/material.dart';
import 'package:marketflow/routes.dart';
import 'package:marketflow/utils/custom_colors.dart';
import 'package:marketflow/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: CustomColors.secondary,
        onPressed: () {
          // Navigator.of(context).pushNamed(Routes.initialRoute);
          Navigator.of(context).pushNamed(Routes.form);
        },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            onLongPress: () {
              // Navigator.of(context).pushNamed(Routes.form);
            },
            title: Text('Arroz'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text('Feijao'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text('Batata'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text('Banana'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text('Queijo'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text('Presunto'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            title: Text('Cebola'),
            subtitle: Text(
              'R\$ 2,99 x2',
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: CustomColors.textSecondary,
            ),
          ),
        ]).toList(),
      ),
    );
  }
}
