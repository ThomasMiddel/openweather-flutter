class Resource<T extends dynamic> {
  final Status status;
  final T data;
  final dynamic error;

  Resource._default({this.status, this.data, this.error});

  Resource.success(this.data)
      : this.error = null,
        this.status = Status.SUCCESS;

  Resource.error(this.error, {this.data}) : this.status = Status.ERROR;

  Resource.loading({this.data})
      : this.error = null,
        this.status = Status.LOADING;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Resource &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              data == other.data &&
              error == other.error;

  @override
  int get hashCode => status.hashCode ^ data.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'Resource{status: $status, error: $error}';
  }

  Resource<T> copyWith({Status status, T data, Object error}) {
    return Resource._default(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

enum Status { SUCCESS, LOADING, ERROR }
