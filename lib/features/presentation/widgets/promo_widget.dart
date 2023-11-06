import 'package:flutter/material.dart';

class PromosWidget extends StatelessWidget {
  const PromosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blue,
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24), color: Colors.black12),
                    child: Center(child: Text('Hotels')),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24), color: Colors.black12),
                    child: Center(child: Text('Flight')),
                  ),
                ),
              ],
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(192),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: EdgeInsets.all(16),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16,
                    ),
                    itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width - 32,
                        color: Colors.grey),
                  ),
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: EdgeInsets.all(16),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16,
                    ),
                    itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width - 32,
                        color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
