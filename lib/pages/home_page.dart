import 'package:flutter/material.dart';
import 'package:q_mart/models/home_model.dart';
import 'package:q_mart/pages/profile_page.dart';
import 'package:q_mart/services/database_service.dart';
import 'package:q_mart/widgets/home_page_category.dart';
import 'package:q_mart/widgets/products_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel? homeModel;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    initMethod();
  }

  initMethod() async {
    var homeData = await DataBaseService.fetchHome();
    setState(() {
      homeModel = homeData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: isLoading || homeModel == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q-Mart",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text("A block, Amrit Vihar"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        homeModel!.bannerImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: double.infinity,
                  height: 100,
                ),
                SizedBox(height: 20),
                HomePageCategory(
                  cat1: homeModel!.categories[0],
                  cat2: homeModel!.categories[1],
                ),
                SizedBox(height: 8),
                HomePageCategory(
                  cat1: homeModel!.categories[2],
                  cat2: homeModel!.categories[3],
                ),
                SizedBox(height: 20),
                Text(
                  homeModel!.homeListName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                ProductsGridView(
                  list: homeModel!.productsList,
                ),
              ],
            ),
    );
  }
}
