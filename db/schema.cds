using {
        cuid,
        managed
} from '@sap/cds/common';

namespace my.bookstore;

type StringText : String(255);

entity Books : cuid, managed {
        title  : StringText;
        author : Association to Authors;
        Chapters : Composition of many Chapters on Chapters.book = $self;
}

entity Authors : cuid, managed {
        name  : StringText;
        books : Association to many Books
                        on books.author = $self;
}

entity Chapters : cuid, managed {
        number : Integer;
        key book : Association to Books;
}