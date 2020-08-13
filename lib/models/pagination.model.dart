class Pagination<T> {
  List<T> data;
  int pageSize;
  int totalCount;
  int currentPage;
  int totalPages;

  Pagination(
      {this.data,
      this.pageSize,
      this.totalCount,
      this.currentPage,
      this.totalPages});
}
