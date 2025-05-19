abstract class DownloadImageState {}

class InitDownloadState extends DownloadImageState {}

class DownloadLoading extends DownloadImageState {}

class DownloadSuccess extends DownloadImageState {}

class DownloadFailure extends DownloadImageState {}
