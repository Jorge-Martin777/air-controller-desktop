part of 'video_folders_bloc.dart';

enum VideoFoldersStatus { initial, loading, success, failure }

class LoadVideosInFolderStatusUnit extends Equatable {
  final VideoFoldersStatus status;
  final List<VideoItem> videos;
  final List<VideoItem> checkedVideos;
  final String? error;

  const LoadVideosInFolderStatusUnit(
      {this.status = VideoFoldersStatus.initial,
      this.videos = const [],
      this.checkedVideos = const [],
      this.error});

  @override
  List<Object?> get props => [status, videos, checkedVideos, error];

  LoadVideosInFolderStatusUnit copyWith(
      {VideoFoldersStatus? status,
      VideoFoldersBoardKeyStatus? keyStatus,
      List<VideoItem>? videos,
      List<VideoItem>? checkedVideos,
      String? error}) {
    return LoadVideosInFolderStatusUnit(
        status: status ?? this.status,
        videos: videos ?? this.videos,
        checkedVideos: checkedVideos ?? this.checkedVideos,
        error: error ?? this.error);
  }
}

class VideoFolderOpenStatus extends Equatable {
  final bool isOpened;
  final VideoFolderItem? current;

  const VideoFolderOpenStatus({this.isOpened = false, this.current = null});

  @override
  List<Object?> get props => [isOpened, current];
}

enum VideoFoldersBoardKeyStatus { none, ctrlDown, shiftDown }

class VideoFoldersOpenMenuStatus extends Equatable {
  final bool isOpened;
  final Offset? position;
  final dynamic target;

  const VideoFoldersOpenMenuStatus(
      {this.isOpened = false, this.position = null, this.target = null});

  @override
  List<Object?> get props => [isOpened, position, target];
}

enum VideoFoldersDeleteStatus { initial, loading, success, failure }

enum VideoFoldersCopyStatus { initial, start, copying, success, failure }

enum VideoFoldersFileType { folder, video }

class VideoFoldersCopyStatusUnit extends Equatable {
  final VideoFoldersFileType fileType;
  final VideoFoldersCopyStatus status;
  final int current;
  final int total;
  final String fileName;
  final String? error;

  const VideoFoldersCopyStatusUnit(
      {required this.fileType,
      this.status = VideoFoldersCopyStatus.initial,
      this.current = 0,
      this.total = 0,
      this.fileName = '',
      this.error});

  @override
  List<Object?> get props =>
      [fileType, status, current, total, fileName, error];
}

enum VideoFoldersUploadStatus { initial, start, uploading, failure, success }

class VideoFoldersUploadStatusUnit extends Equatable {
  final VideoFoldersUploadStatus status;
  final int total;
  final int current;
  final List<File> videos;
  final String? failureReason;

  const VideoFoldersUploadStatusUnit(
      {this.status = VideoFoldersUploadStatus.initial,
      this.total = 1,
      this.current = 0,
      this.videos = const [],
      this.failureReason});

  @override
  List<Object?> get props => [status, total, current, videos, failureReason];

  VideoFoldersUploadStatusUnit copyWith(
      {VideoFoldersUploadStatus? status,
      int? total,
      int? current,
      List<File>? photos,
      String? failureReason}) {
    return VideoFoldersUploadStatusUnit(
        status: status ?? this.status,
        current: current ?? this.current,
        total: total ?? this.total,
        videos: photos ?? this.videos,
        failureReason: failureReason ?? this.failureReason);
  }
}

class VideoFoldersState extends Equatable {
  final List<VideoFolderItem> videoFolders;
  final List<VideoFolderItem> checkedVideoFolders;
  final VideoFoldersStatus status;
  final String? failureReason;
  final LoadVideosInFolderStatusUnit loadVideosInFolderStatus;
  final VideoFolderOpenStatus videoFolderOpenStatus;
  final VideoFoldersBoardKeyStatus keyStatus;
  final VideoFoldersOpenMenuStatus openMenuStatus;
  final VideoFoldersDeleteStatus deleteStatus;
  final VideoFoldersCopyStatusUnit copyStatus;
  final VideoFoldersUploadStatusUnit uploadStatus;
  final bool showLoading;
  final bool showError;

  const VideoFoldersState(
      {this.videoFolders = const [],
      this.checkedVideoFolders = const [],
      this.status = VideoFoldersStatus.initial,
      this.failureReason = null,
      this.loadVideosInFolderStatus = const LoadVideosInFolderStatusUnit(),
      this.videoFolderOpenStatus = const VideoFolderOpenStatus(isOpened: false),
      this.keyStatus = VideoFoldersBoardKeyStatus.none,
      this.openMenuStatus = const VideoFoldersOpenMenuStatus(),
      this.deleteStatus = VideoFoldersDeleteStatus.initial,
      this.copyStatus = const VideoFoldersCopyStatusUnit(
          fileType: VideoFoldersFileType.folder),
      this.uploadStatus = const VideoFoldersUploadStatusUnit(),
      this.showError = false,
      this.showLoading = false});

  @override
  List<Object?> get props => [
        videoFolders,
        checkedVideoFolders,
        status,
        failureReason,
        loadVideosInFolderStatus,
        videoFolderOpenStatus,
        keyStatus,
        openMenuStatus,
        deleteStatus,
        copyStatus,
        uploadStatus,
        showError,
        showLoading
      ];

  VideoFoldersState copyWith(
      {List<VideoFolderItem>? videoFolders,
      List<VideoFolderItem>? checkedVideoFolders,
      VideoFoldersStatus? status,
      String? failureReason,
      LoadVideosInFolderStatusUnit? loadVideosInFolderStatus,
      VideoFolderOpenStatus? videoFolderOpenStatus,
      VideoFoldersBoardKeyStatus? keyStatus,
      VideoFoldersOpenMenuStatus? openMenuStatus,
      VideoFoldersDeleteStatus? deleteStatus,
      VideoFoldersCopyStatusUnit? copyStatus,
      VideoFoldersUploadStatusUnit? uploadStatus,
      bool? showError,
      bool? showLoading}) {
    return VideoFoldersState(
        videoFolders: videoFolders ?? this.videoFolders,
        checkedVideoFolders: checkedVideoFolders ?? this.checkedVideoFolders,
        status: status ?? this.status,
        failureReason: failureReason ?? this.failureReason,
        loadVideosInFolderStatus:
            loadVideosInFolderStatus ?? this.loadVideosInFolderStatus,
        videoFolderOpenStatus:
            videoFolderOpenStatus ?? this.videoFolderOpenStatus,
        keyStatus: keyStatus ?? this.keyStatus,
        openMenuStatus: openMenuStatus ?? this.openMenuStatus,
        deleteStatus: deleteStatus ?? this.deleteStatus,
        copyStatus: copyStatus ?? this.copyStatus,
        uploadStatus: uploadStatus ?? this.uploadStatus,
        showError: showError ?? this.showError,
        showLoading: showLoading ?? this.showLoading);
  }
}
