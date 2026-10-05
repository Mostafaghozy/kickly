class ApiErrors {
  final String detail;
  final int? statusCode;

  ApiErrors({required this.detail, this.statusCode});

  @override
  String toString() {
    return 'error is $detail(statusCode is $statusCode)';
  }
}
