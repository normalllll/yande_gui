// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.5.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

class Post {
  final PlatformInt64 id;
  final String tags;
  final PlatformInt64 createdAt;
  final PlatformInt64 updatedAt;
  final PlatformInt64? creatorId;
  final String author;
  final PlatformInt64 change;
  final String source;
  final PlatformInt64 score;
  final String md5;
  final PlatformInt64 fileSize;
  final String fileExt;
  final String? fileUrl;
  final bool isShownInIndex;
  final String previewUrl;
  final PlatformInt64 previewWidth;
  final PlatformInt64 previewHeight;
  final PlatformInt64 actualPreviewWidth;
  final PlatformInt64 actualPreviewHeight;
  final String sampleUrl;
  final PlatformInt64 sampleWidth;
  final PlatformInt64 sampleHeight;
  final PlatformInt64 sampleFileSize;
  final String jpegUrl;
  final PlatformInt64 jpegWidth;
  final PlatformInt64 jpegHeight;
  final PlatformInt64 jpegFileSize;
  final String rating;
  final bool isRatingLocked;
  final bool hasChildren;
  final PlatformInt64? parentId;
  final String status;
  final bool isPending;
  final PlatformInt64 width;
  final PlatformInt64 height;
  final bool isHeld;
  final bool isNoteLocked;

  const Post({
    required this.id,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    this.creatorId,
    required this.author,
    required this.change,
    required this.source,
    required this.score,
    required this.md5,
    required this.fileSize,
    required this.fileExt,
    this.fileUrl,
    required this.isShownInIndex,
    required this.previewUrl,
    required this.previewWidth,
    required this.previewHeight,
    required this.actualPreviewWidth,
    required this.actualPreviewHeight,
    required this.sampleUrl,
    required this.sampleWidth,
    required this.sampleHeight,
    required this.sampleFileSize,
    required this.jpegUrl,
    required this.jpegWidth,
    required this.jpegHeight,
    required this.jpegFileSize,
    required this.rating,
    required this.isRatingLocked,
    required this.hasChildren,
    this.parentId,
    required this.status,
    required this.isPending,
    required this.width,
    required this.height,
    required this.isHeld,
    required this.isNoteLocked,
  });

  @override
  int get hashCode =>
      id.hashCode ^
      tags.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      creatorId.hashCode ^
      author.hashCode ^
      change.hashCode ^
      source.hashCode ^
      score.hashCode ^
      md5.hashCode ^
      fileSize.hashCode ^
      fileExt.hashCode ^
      fileUrl.hashCode ^
      isShownInIndex.hashCode ^
      previewUrl.hashCode ^
      previewWidth.hashCode ^
      previewHeight.hashCode ^
      actualPreviewWidth.hashCode ^
      actualPreviewHeight.hashCode ^
      sampleUrl.hashCode ^
      sampleWidth.hashCode ^
      sampleHeight.hashCode ^
      sampleFileSize.hashCode ^
      jpegUrl.hashCode ^
      jpegWidth.hashCode ^
      jpegHeight.hashCode ^
      jpegFileSize.hashCode ^
      rating.hashCode ^
      isRatingLocked.hashCode ^
      hasChildren.hashCode ^
      parentId.hashCode ^
      status.hashCode ^
      isPending.hashCode ^
      width.hashCode ^
      height.hashCode ^
      isHeld.hashCode ^
      isNoteLocked.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          tags == other.tags &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          creatorId == other.creatorId &&
          author == other.author &&
          change == other.change &&
          source == other.source &&
          score == other.score &&
          md5 == other.md5 &&
          fileSize == other.fileSize &&
          fileExt == other.fileExt &&
          fileUrl == other.fileUrl &&
          isShownInIndex == other.isShownInIndex &&
          previewUrl == other.previewUrl &&
          previewWidth == other.previewWidth &&
          previewHeight == other.previewHeight &&
          actualPreviewWidth == other.actualPreviewWidth &&
          actualPreviewHeight == other.actualPreviewHeight &&
          sampleUrl == other.sampleUrl &&
          sampleWidth == other.sampleWidth &&
          sampleHeight == other.sampleHeight &&
          sampleFileSize == other.sampleFileSize &&
          jpegUrl == other.jpegUrl &&
          jpegWidth == other.jpegWidth &&
          jpegHeight == other.jpegHeight &&
          jpegFileSize == other.jpegFileSize &&
          rating == other.rating &&
          isRatingLocked == other.isRatingLocked &&
          hasChildren == other.hasChildren &&
          parentId == other.parentId &&
          status == other.status &&
          isPending == other.isPending &&
          width == other.width &&
          height == other.height &&
          isHeld == other.isHeld &&
          isNoteLocked == other.isNoteLocked;
}
