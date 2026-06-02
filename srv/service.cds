using { bookshop_cds as my } from '../db/schema.cds';

@path: '/service/bookshop_cds'
service bookshop_cdsSrv {
  
  @odata.draft.enabled
  @requires: ['ViewBooks']
  entity Books as projection on my.Books {
    *,
    virtual authorNames : String(500)
  } excluding {
    createdBy, modifiedBy
  };

  @odata.draft.enabled
  @requires: ['ViewAuthors']
  entity Authors as projection on my.Authors {
    *
  } excluding {
    createdBy, modifiedBy
  };
  
  @odata.draft.enabled
  @requires: ['ViewBooksAuthors']
  entity BooksAuthors as projection on my.BooksAuthors;
}