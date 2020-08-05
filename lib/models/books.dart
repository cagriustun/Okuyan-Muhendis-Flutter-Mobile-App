class Book {
  String title, writer, image, description = 'cagriustuncagriustuncagriustun';
  int pages;
  double rating;

  Book(this.title, this.writer, this.image, this.rating, this.pages);
}

final List<Book> books = [
  Book('Beyaz Geceler', 'Dostoyevski', 'books/beyazgeceler.jpg', 3.5, 355),
  Book('Beyaz Geceler', 'Dostoyevski', 'books/beyazgeceler.jpg', 3.5, 355),
  Book('Beyaz Geceler', 'Dostoyevski', 'books/beyazgeceler.jpg', 3.5, 355),
];
