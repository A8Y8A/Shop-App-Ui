import 'package:flutter/material.dart';
import 'package:quiz2/core/utils/color_manager.dart';
import 'package:quiz2/core/utils/string_manager.dart';
import 'package:quiz2/presentation/screen/products_by_category.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: ColorManager.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                  StringManager.hey,
                  style: TextStyle(
                    fontFamily: StringManager.manrope,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              titlePadding: const EdgeInsets.only(bottom: 170.0),
              background: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 110.0),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: StringManager.shop,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          TextSpan(
                            text: StringManager.byCategory,
                            style: TextStyle(
                              fontFamily: StringManager.manrope,
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {},
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: ColorManager.offercolor,
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [_buildCategory(context)],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategory(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: [
            _buildCategoryCard(
                StringManager.category1, StringManager.category5, context),
            _buildCategoryCard(
                StringManager.category2, StringManager.organic, context),
            _buildCategoryCard(
                StringManager.category3, StringManager.organic, context),
            _buildCategoryCard(
                StringManager.category4, StringManager.category6, context),
            _buildCategoryCard(
                StringManager.category3, StringManager.organic, context),
            _buildCategoryCard(
                StringManager.category3, StringManager.organic, context),
          ],
        ),
      ],
    ),
  );
}

Widget _buildCategoryCard(String title, String subtitle, BuildContext context) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: ColorManager.whitly,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.image, size: 48.0, color: Colors.grey)),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    ),
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductCategory()));
    },
  );
}
