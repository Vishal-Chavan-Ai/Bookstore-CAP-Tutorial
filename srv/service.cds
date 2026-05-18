using {my.bookstore as my} from '../db/schema';


service BookstoreService {
    entity Books      as projection on my.Books
        actions {
            @(Common.SideEffects: {TargetProperties: ['stock']})
            action addStock();
            action changePublishDate(newDate: Date);
            @(Common.SideEffects: {TargetProperties: ['status_code']})
            action changeStatus( @(Common: {
                                     ValueListWithFixedValues: true,
                                     Label                   : 'New status',
                                     ValueList               : {
                                         $Type         : 'Common.ValueListType',
                                         CollectionPath: 'BookStatus',
                                         Parameters    : [{
                                             $Type            : 'Common.ValueListParameterInOut',
                                             LocalDataProperty: newStatus,
                                             ValueListProperty: 'code',
                                         }, ],
                                     },
                                 })
                                 newStatus: String)
        }

    @(Common.SideEffects: {TargetEntities: ['/BookstoreService.EntityContainer/Books']})
    action addDiscount();
    
    entity Authors    as projection on my.Authors;
    entity Chapters   as projection on my.Chapters;
    entity BookStatus as projection on my.BookStatus;

    entity GenresVH   as projection on my.Genres;
}

annotate BookstoreService.Books with @odata.draft.enabled;
