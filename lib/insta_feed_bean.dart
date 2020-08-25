/*
 * Copyright © 2020, Simform Solutions
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

library insta_feed_bean;

/// model class for insta feed
class InstaFeedBean {
  Graphql graphql;

  InstaFeedBean({this.graphql});

  InstaFeedBean.fromJson(Map<String, dynamic> json) {
    graphql =
    json['graphql'] != null ? Graphql.fromJson(json['graphql']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.graphql != null) {
      data['graphql'] = this.graphql.toJson();
    }
    return data;
  }
}

class Graphql {
  InstagramUserData userData;

  Graphql({this.userData});

  Graphql.fromJson(Map<String, dynamic> json) {
    userData = json['user'] != null
        ? InstagramUserData.fromJson(json['user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.userData != null) {
      data['user'] = this.userData.toJson();
    }
    return data;
  }
}

class InstagramUserData {
  EdgeOwnerTimeLine edgeOwnerTimeLine;
  String profilePicUrl;

  InstagramUserData.fromJson(Map<String, dynamic> json) {
    edgeOwnerTimeLine = json['edge_owner_to_timeline_media'] != null
        ? EdgeOwnerTimeLine.fromJson(json['edge_owner_to_timeline_media'], json)
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.edgeOwnerTimeLine != null) {
      data['edge_owner_to_timeline_media'] = this.edgeOwnerTimeLine.toJson();
    }
    data['profile_pic_url'] = this.profilePicUrl;
    return data;
  }
}

class EdgeOwnerTimeLine {
  List<InstagramFeedData> edge;

  EdgeOwnerTimeLine.fromJson(Map<String, dynamic> json, Map<String, dynamic> userJson) {
    edge = json['edges'] != null
        ? parseEdges(json, userJson)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.edge != null) {
      data['edges'] = this.edge.toList();
    }
    return data;
  }

  parseEdges(Map<String, dynamic> json, Map<String, dynamic> userJson) {
    var list = json['edges'] as List;
    List<InstagramFeedData> edgesList =
    list.map((data) {
      return InstagramFeedData.fromJson(data['node'], userJson);
    }).toList();
    return edgesList;
  }
}

class InstagramFeedData {
  String id;
  String shortcode;
  String displayUrl;
  bool hasAudio;
  String videoUrl;
  String imageUrl;
  bool isVideo = false;
  bool isImage = false;
  String trackingToken;
  EdgeMediaToCaption edgeMediaToCaption;
  EdgeMediaPreviewComment edgeMediaPreviewComment;
  EdgeMediaPreviewLike edgeMediaPreviewLike;
  int takenAtTimestamp;
  Owner owner;
  String title;
  double videoDuration;
  String thumbnailSrc;
  InstagramLocation locaton;
  String profilePicUrl;
  String fullName;

  InstagramFeedData(
      {this.id,
        this.shortcode,
        this.displayUrl,
        this.hasAudio,
        this.videoUrl,
        this.imageUrl,
        this.isVideo,
        this.isImage,
        this.trackingToken,
        this.edgeMediaToCaption,
        this.edgeMediaPreviewComment,
        this.takenAtTimestamp,
        this.owner,
        this.title,
        this.edgeMediaPreviewLike,
        this.videoDuration,
        this.thumbnailSrc,
        this.locaton,
        this.profilePicUrl,
        this.fullName});

  InstagramFeedData.fromJson(Map<String, dynamic> json, Map<String, dynamic> userJson) {
    id = json['id'];
    shortcode = json['shortcode'];
    displayUrl = json['display_url'];
    hasAudio = json['has_audio'];
    videoUrl = json['video_url'];
    imageUrl = json['display_url'] != null? json['display_url'] : json['image_url'];
    isVideo = json['is_video'] ?? false;
    isImage = json['display_url'] != null ? true : false;
    edgeMediaPreviewLike = json['edge_media_preview_like'] != null
        ? new EdgeMediaPreviewLike.fromJson(json['edge_media_preview_like'])
        : null;
    trackingToken = json['tracking_token'];
    edgeMediaToCaption = json['edge_media_to_caption'] != null
        ? EdgeMediaToCaption.fromJson(json['edge_media_to_caption'])
        : null;
    edgeMediaPreviewComment = json['edge_media_preview_comment'] != null
        ? EdgeMediaPreviewComment.fromJson(json['edge_media_preview_comment'])
        : null;
    takenAtTimestamp = json['taken_at_timestamp'] * 1000;
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    title = json['title'];
    videoDuration = json['video_duration'];
    thumbnailSrc = json['thumbnail_src'];
    locaton = json['location'] != null
        ? InstagramLocation.fromJson(json['location'])
        : null;
    profilePicUrl = userJson['profile_pic_url'];
    fullName = userJson['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['shortcode'] = this.shortcode;
    data['display_url'] = this.displayUrl;
    data['has_audio'] = this.hasAudio;
    data['video_url'] = this.videoUrl;
    data['image_url'] = this.imageUrl;
    data['is_image'] = this.isImage;
    data['tracking_token'] = this.trackingToken;
    if (this.edgeMediaPreviewLike != null) {
      data['edge_media_preview_like'] = this.edgeMediaPreviewLike.toJson();
    }
    if (this.edgeMediaToCaption != null) {
      data['edge_media_to_caption'] = this.edgeMediaToCaption.toJson();
    }
    if (this.edgeMediaPreviewComment != null) {
      data['edge_media_preview_comment'] =
          this.edgeMediaPreviewComment.toJson();
    }
    data['taken_at_timestamp'] = this.takenAtTimestamp;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['title'] = this.title;
    data['video_duration'] = this.videoDuration;
    data['thumbnail_src'] = this.thumbnailSrc;
    if (this.locaton != null) {
      data['location'] = this.locaton.toJson();
    }
    data['profile_pic_url'] = this.profilePicUrl;
    data['full_name'] = this.fullName;
    return data;
  }
}

class InstagramLocation {
  String name;

  InstagramLocation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class EdgeMediaPreviewLike {
  int count;

  EdgeMediaPreviewLike({this.count});

  EdgeMediaPreviewLike.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class EdgeMediaToCaption {
  List<Edges> edges;

  EdgeMediaToCaption({this.edges});

  EdgeMediaToCaption.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = List<Edges>();
      json['edges'].forEach((v) {
        edges.add(Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  Node node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class EdgeMediaPreviewComment {
  int count;
  List<Edges> edges;

  EdgeMediaPreviewComment({this.count, this.edges});

  EdgeMediaPreviewComment.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['edges'] != null) {
      edges = List<Edges>();
      json['edges'].forEach((v) {
        edges.add(Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Node {
  String id;
  String text;
  int createdAt;
  Owner owner;
  EdgeLikedBy edgeLikedBy;

  Node({this.id, this.text, this.createdAt, this.owner, this.edgeLikedBy});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['created_at'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    edgeLikedBy = json['edge_liked_by'] != null
        ? EdgeLikedBy.fromJson(json['edge_liked_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    if (this.edgeLikedBy != null) {
      data['edge_liked_by'] = this.edgeLikedBy.toJson();
    }
    return data;
  }
}

class EdgeLikedBy {
  int count;

  EdgeLikedBy({this.count});

  EdgeLikedBy.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Owner {
  String id;
  String username;
  String fullName;
  EdgeLikedBy edgeOwnerToTimelineMedia;
  EdgeLikedBy edgeFollowedBy;

  Owner(
      {this.id,
        this.username,
        this.fullName,
        this.edgeOwnerToTimelineMedia,
        this.edgeFollowedBy});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['full_name'];
    edgeOwnerToTimelineMedia = json['edge_owner_to_timeline_media'] != null
        ? EdgeLikedBy.fromJson(json['edge_owner_to_timeline_media'])
        : null;
    edgeFollowedBy = json['edge_followed_by'] != null
        ? EdgeLikedBy.fromJson(json['edge_followed_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    if (this.edgeOwnerToTimelineMedia != null) {
      data['edge_owner_to_timeline_media'] =
          this.edgeOwnerToTimelineMedia.toJson();
    }
    if (this.edgeFollowedBy != null) {
      data['edge_followed_by'] = this.edgeFollowedBy.toJson();
    }
    return data;
  }
}