import 'package:flutter/material.dart';
import 'package:quiz2/core/utils/color_manager.dart';
import 'package:quiz2/core/utils/string_manager.dart';

class HomePage extends StatelessWidget {
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
              background: Column(
                children: [
                  const SizedBox(height: 150.0),
                  _buildSearchBar(),
                  SizedBox(height: 20.0),
                  _buildDeliveryInfo(),
                ],
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
              [
                _buildOffers(),
                _buildRecommended(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.darkPrimaryColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: StringManager.search,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.deliver,
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              Row(
                children: [
                  Text(
                    StringManager.way,
                    style: TextStyle(
                      fontFamily: StringManager.manrope,
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                StringManager.within,
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              Row(
                children: [
                  Text(
                    StringManager.hour,
                    style: TextStyle(
                      fontFamily: StringManager.manrope,
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOffers() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            _buildOfferCard(StringManager.offer50, StringManager.offer3Orders,
                ColorManager.offercolor),
            _buildOfferCard(StringManager.offer30, StringManager.offerAllOrders,
                ColorManager.offer2color),
            _buildOfferCard(StringManager.offer30, StringManager.offerAllOrders,
                ColorManager.offer2color),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCard(String title, String subtitle, Color color) {
    return Container(
      width: 250.0,
      //height: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.image, size: 48.0, color: Colors.white),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: StringManager.manrope,
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontFamily: StringManager.manrope,
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommended(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManager.recommended,
            style: TextStyle(
              fontFamily: StringManager.manrope,
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 20.0,
            children: [
              _buildProductCard(StringManager.product2, StringManager.organic,
                  '\$12', context),
              _buildProductCard(StringManager.product1, StringManager.organic,
                  '\$6', context),
              _buildProductCard(StringManager.product3, StringManager.organic,
                  '\$9', context),
              _buildProductCard(StringManager.product4, StringManager.organic,
                  '\$15', context),
              _buildProductCard(StringManager.product4, StringManager.organic,
                  '\$15', context),
              _buildProductCard(StringManager.product4, StringManager.organic,
                  '\$15', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      String title, String subtitle, String price, BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: ColorManager.whitly,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.image, size: 48.0, color: Colors.grey)),
            SizedBox(height: 30.0),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unit $price',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.add_circle, color: ColorManager.primaryColor),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => ProductDetailsPage()));
      },
    );
  }
}
