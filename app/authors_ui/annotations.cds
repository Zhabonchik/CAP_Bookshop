using bookshop_cdsSrv as service from '../../srv/service';

annotate service.Authors with @(
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : bio,
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
                Value : books.book.title,
                Label : 'Books'
            },
        ],
    }
);

annotate service.Authors with @UI.HeaderInfo: { TypeName: 'Author', TypeNamePlural: 'Authors', Title: { Value: name } };

annotate service.Authors with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};

annotate service.Authors with @UI.Identification: [{ Value: name }];

annotate service.Authors with {
  name @title: 'Name';
  bio @title: 'Biography';
  createdAt @title: 'Created At';
  modifiedAt @title: 'Modified At';
};

annotate service.Authors with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: bio }
];

annotate service.Authors with {
  books @Common.Label: 'Assigned Books' 
};

annotate service.Authors with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'BooksList', Label: 'Assigned Books', Target: 'books/@UI.LineItem#AuthorView' }
];

annotate service.Authors with @UI.SelectionFields: [
  name
];

annotate service.Authors with @Common.SemanticObject: 'Author';