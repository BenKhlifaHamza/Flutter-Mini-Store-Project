import 'package:flutter/material.dart';
import 'package:mini_e_commerce/core/colors.dart';
import 'package:mini_e_commerce/models/product_model.dart';
import 'package:mini_e_commerce/views/widgets/home/icon_widget.dart';
import 'package:mini_e_commerce/views/widgets/home/item_widget.dart';
import 'package:mini_e_commerce/views/widgets/home/search_field.dart';
import '../../core/apis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemModel>? _products;
  late AppAPIs _myAPIs;

  void _getProducts() async {
    List<dynamic> temp = await _myAPIs.fetchData(
        url: "https://api.escuelajs.co/api/v1/products");
    _products = [];
    _products!.addAll(temp.map((item) => ItemModel.fromJson(item)));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _myAPIs = AppAPIs();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        drawer: _buildDrawer(context),
        appBar: _buildAppBar(context),
        body: _buildBody(context));
  }

  Drawer _buildDrawer(BuildContext context) => Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 40,
        actions: [
          const SearchField(),
          iconWidget(icon: Icons.add_shopping_cart_outlined),
          iconWidget(icon: Icons.favorite_outline_outlined)
        ],
      );

  Widget _buildBody(BuildContext context) => _products == null
      ? const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurpleAccent,
          ),
        )
      : _products!.isEmpty
          ? const Center(
              child: Text("No Data Found"),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemCount: _products!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemWidget(item: _products![index]);
                },
              ),
            );
}
