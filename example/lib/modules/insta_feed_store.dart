import 'dart:async';

import 'package:ssinstafeedparser/insta_feed_bean.dart';
import 'package:ssinstafeedparser/insta_feed_parser.dart';
import 'package:mobx/mobx.dart';

part 'insta_feed_store.g.dart';

/// mobx store for home page
class InstaFeedStore = _InstaFeedStore with _$InstaFeedStore;

abstract class _InstaFeedStore with Store {

  @observable
  ObservableList<InstagramFeedData> instaFeedList = ObservableList.of([]);

  @action
  getInstaFeedList(String url) async {
    var feeds = await InstaFeedParser.feedsFromProfile(url);
    if (feeds != null) {
      feeds.forEach((feed) async {
        instaFeedList.add(feed);
      });
    }
  }
}
