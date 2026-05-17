using {my.bookstore as my} from '../db/schema';


service BookstoreService {
    entity Books as projection on my.Books;
    entity Authors as projection on my.Authors;
    entity Chapters as projection on my.Chapters;
}
