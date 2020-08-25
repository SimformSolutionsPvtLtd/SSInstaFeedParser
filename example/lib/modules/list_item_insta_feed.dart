import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssinstafeedparser/insta_feed_bean.dart';
import 'package:instafeedparser_example/utils/date_utils.dart';
import 'package:instafeedparser_example/values/app_colors.dart';
import 'package:instafeedparser_example/values/images.dart';
import 'package:instafeedparser_example/values/vectors.dart';
import 'app_video.dart';

// ignore: must_be_immutable
class ItemInstaFeed extends StatelessWidget {
  double width;
  InstagramFeedData instaFeedBean;

  ItemInstaFeed({this.width, this.instaFeedBean});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.colorE50D7F),
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.network(
                      instaFeedBean.profilePicUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      instaFeedBean.fullName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  Images.icoInsta,
                  width: 22,
                  height: 22,
                )
              ],
            ),
          ),
          Visibility(
            visible: instaFeedBean.isImage ||
                instaFeedBean.isVideo,
            child: Container(
              color: AppColors.colorDBE2ED,
              height: 200,
              child: instaFeedBean.isVideo
                  ? AppVideo(
                videoUrl: instaFeedBean.videoUrl,
                videoThumb:
                instaFeedBean.thumbnailSrc,
              )
                  : Image.network(
                instaFeedBean.imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                Vectors.icoLike,
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${instaFeedBean.edgeMediaPreviewLike.count} likes',
                style: TextStyle(color: Colors.black, fontSize: 8),
              ),
              Spacer(),
              Text(
                DateUtils.convertTimeStampToDate(
                    instaFeedBean.takenAtTimestamp),
                style: TextStyle(color: AppColors.color838383, fontSize: 8),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              instaFeedBean.edgeMediaToCaption.edges != null
                  ? instaFeedBean.edgeMediaToCaption.edges[0].node.text
                  : '',
              style: TextStyle(color: AppColors.color333333, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}