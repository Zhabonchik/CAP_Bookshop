using bookshop_cdsSrv as service from '../../srv/service';

annotate service.Books with @(
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : isbn,
            },
            {
                $Type : 'UI.DataField',
                Value : publishedDate,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : authorNames,
                Label : 'Authors',
            },
        ],
    }
);

annotate service.Books with @UI.HeaderInfo: { TypeName: 'Book', TypeNamePlural: 'Books', Title: { Value: title } };

annotate service.Books with {
  ID @UI.Hidden @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly }
};

annotate service.Books with @UI.Identification: [{ Value: title }];

annotate service.Books with {
  title @title: 'Title';
  isbn @title: 'ISBN';
  publishedDate @title: 'Published Date';
  price @title: 'Price';
  createdAt @title: 'Created At';
  modifiedAt @title: 'Modified At';
};

annotate service.Books with {
  price @Measures.ISOCurrency: Currency_code
};

annotate service.Books with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: title },
 { $Type: 'UI.DataField', Value: isbn },
 { $Type: 'UI.DataField', Value: publishedDate },
 { $Type: 'UI.DataField', Value: price }
];

annotate service.Books with {
  authors @Common.Label: 'Assigned Authors' 
};

annotate service.Books with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'AuthorsList', Label: 'Assigned Authors', Target: 'authors/@UI.LineItem#BookView' }
];

annotate service.Books with @UI.SelectionFields: [
  title
];

annotate service.Books with @Common.SemanticObject: 'Book';