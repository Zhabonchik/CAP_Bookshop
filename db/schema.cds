namespace bookshop_cds;
using { cuid, managed, Currency } from '@sap/cds/common';

@assert.unique: { title: [title] }
entity Books : cuid, managed {
  title: String(100) @mandatory;
  isbn: String(20);
  publishedDate: Date;
  price: Decimal(10,2);
  Currency: Currency;
  authors: Association to many BooksAuthors on authors.book = $self;
}

@assert.unique: { name: [name] }
entity Authors : cuid, managed {
  name: String(100) @mandatory;
  bio: String(500);
  books: Association to many BooksAuthors on books.author = $self;
}

entity BooksAuthors : cuid {
  book: Association to Books;
  author: Association to Authors;
}