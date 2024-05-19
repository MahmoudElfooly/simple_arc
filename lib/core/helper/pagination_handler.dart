import 'package:flutter/material.dart';

class PaginationHandler {
  int limit;
  ScrollController scrollController = ScrollController();
  int currentPage = 0;
  int totalPages = 1;
  bool isLoading = false;
  bool isDisable = false;
  Future<void> Function()? fetchData;

  PaginationHandler({this.limit = 10});

  int get nextPage {
    return currentPage + 1;
  }

  bool get hasMorePages {
    return currentPage < totalPages;
  }

  String get parameters {
    return "?page=$nextPage&pageSize=$limit";
  }

  String get parametersWithAndSymbol {
    return "&page=$nextPage&pageSize=$limit";
  }

  void handlingPaginationFromJson(Map<String, dynamic> json) {
    totalPages = json["noOfPages"] ?? 1;
    currentPage++;
    isLoading = false;
  }

  void resetHandler() {
    currentPage = 0;
    totalPages = 1;
    isLoading = false;
  }

  void addListenerToController() {
    scrollController.addListener(
      () {
        if (!isDisable &&
            hasMorePages &&
            scrollController.position.pixels >=
                scrollController.position.maxScrollExtent &&
            !isLoading) {
          isLoading = true;
          fetchData!();
        }
      },
    );
  }

  disable() {
    isDisable = true;
  }

  enable() {
    isDisable = false;
  }

  dispose() {
    scrollController.dispose();
  }
}
