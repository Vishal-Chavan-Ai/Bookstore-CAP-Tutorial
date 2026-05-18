using {my.bookstore as my} from '../db/schema';


service BookstoreService {
    entity Books      as projection on my.Books;
    entity Authors    as projection on my.Authors;
    entity Chapters   as projection on my.Chapters;
    entity BookStatus as projection on my.BookStatus;

    entity GenresVH   as projection on my.Genres;
}

annotate BookstoreService.Books with @odata.draft.enabled;
