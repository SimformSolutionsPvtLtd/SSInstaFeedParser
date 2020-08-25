import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instafeedparser_example/modules/insta_feed_store.dart';
import 'list_item_insta_feed.dart';

// ignore: must_be_immutable
class InstaFeedView extends StatefulObserverWidget {
  String url;

  InstaFeedView({@required this.url});

  @override
  _InstaFeedViewState createState() => _InstaFeedViewState();
}

class _InstaFeedViewState extends State<InstaFeedView> {
  InstaFeedStore _instaFeedStore;

  @override
  void initState() {
    _instaFeedStore = InstaFeedStore();
    _instaFeedStore.getInstaFeedList(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      alignment: Alignment.center,
      child: _instaFeedStore.instaFeedList.length != 0
          ? Container(
              color: Colors.black,
              padding: EdgeInsets.all(5),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 1,
                itemCount: _instaFeedStore.instaFeedList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => ItemInstaFeed(
                  instaFeedBean: _instaFeedStore.instaFeedList[index],
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            )
          : CircularProgressIndicator(
              strokeWidth: 5,
            ),
    );
  }
}
