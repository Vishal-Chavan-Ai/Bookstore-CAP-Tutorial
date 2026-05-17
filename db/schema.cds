using {
        cuid,
        managed
} from '@sap/cds/common';

namespace my.bookstore;

type StringText : String(255);

entity Books : cuid, managed {
        title       : StringText;
        author      : Association to Authors;
        genre       : StringText;
        publishedAt : Date;
        pages       : Integer;
        price       : Decimal(9, 2);
        Chapters    : Composition of many Chapters
                              on Chapters.book = $self;
}

entity Authors : cuid, managed {
        name  : StringText;
        books : Association to many Books
                        on books.author = $self;
}

entity Chapters : cuid, managed {
        key book   : Association to Books;
            number : Integer;
            title  : StringText;
            pages  : Integer;
}
