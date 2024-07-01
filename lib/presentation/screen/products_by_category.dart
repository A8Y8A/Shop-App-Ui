import 'package:flutter/material.dart';
import 'package:quiz2/core/utils/color_manager.dart';
import 'package:quiz2/core/utils/string_manager.dart';

// ignore: must_be_immutable
class ProductCategory extends StatelessWidget {
  ProductCategory({super.key});
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 80.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                // margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 10, bottom: 22),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorManager.whitly),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                            size: 10,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      StringManager.category1,
                      style: TextStyle(
                          fontFamily: StringManager.manrope,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              titlePadding: const EdgeInsets.only(bottom: 0),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.black),
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
              [
                const builchoice(),
                _buildCategory(context),
                // _buildOffers(),
                // _buildRecommended(),
                //_buildCategory()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class builchoice extends StatefulWidget {
  const builchoice({super.key});

  @override
  State<builchoice> createState() => _builchoiceState();
}

class _builchoiceState extends State<builchoice> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(5),
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                        color: current == index
                            ? ColorManager.offercolor
                            : Colors.white,
                        borderRadius: current == index
                            ? BorderRadius.circular(20)
                            : BorderRadius.circular(20),
                        border: Border.all(
                          color: current == index
                              ? ColorManager.offercolor
                              : ColorManager.lightGrey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          StringManager.small,
                          style: TextStyle(
                            fontSize: 16,
                            color: current == index
                                ? Colors.white
                                : ColorManager.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]));
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
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: [
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
            _buildCategoryCard(
                StringManager.price, StringManager.description, context),
          ],
        ),
      ],
    ),
  );
}

Widget _buildCategoryCard(String title, String subtitle, BuildContext context) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: ColorManager.whitly,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Icon(Icons.image, size: 48.0, color: Colors.grey)),
          const SizedBox(height: 20.0),
          // Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 110.0),
            child: Icon(Icons.add_circle, color: ColorManager.primaryColor),
          ),
          const SizedBox(height: 20.0),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    ),
    onTap: () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ProductCategory()));
    },
  );
}
