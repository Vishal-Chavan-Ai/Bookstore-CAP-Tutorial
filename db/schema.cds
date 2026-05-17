using {
        cuid,
        managed
} from '@sap/cds/common';

namespace my.bookstore;

type StringText     : String(255);

entity Books : cuid, managed {
        title       : StringText;
        author      : Association to Authors;
        genre       : StringText;
        publishedAt : Date;
        pages       : Integer;
        price       : Decimal(9, 2);
        stock       : Integer;
        status      : Association to BookStatus;
        Chapters    : Composition of many Chapters
                              on Chapters.book = $self;
}

entity BookStatus {
        key code        : String(1) enum {
                    Available = 'A';
                    Low_Stock = 'L';
                    Unavailable = 'U';
            };
            criticality : Integer;
            displayText : StringText;
}

type BookStatusCode : String(1) enum {
        Available = 'A';
        Low_Stock = 'L';
        Unavailable = 'U';
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
