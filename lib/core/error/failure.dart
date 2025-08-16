import "package:equatable/equatable.dart";


class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, this.statusCode});

  final int? statusCode;

  @override
  List<Object?> get props => <Object?>[message, statusCode];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class FormatFailure extends Failure {
  const FormatFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class ProductUploadFailure extends Failure {
  const ProductUploadFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class DownloadFailure extends Failure {
  const DownloadFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class DeleteFailure extends Failure {
  const DeleteFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class ImageFailure extends Failure {
  const ImageFailure({required super.message});

  @override
  List<Object?> get props => <Object?>[message];
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super(message: "");

  @override
  List<Object?> get props => <Object?>[message];
}