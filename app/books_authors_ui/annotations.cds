using bookshop_cdsSrv as service from '../../srv/service';

// -----------------------------------------------------------
// 1. Labels & Text Arrangements
// -----------------------------------------------------------
annotate service.BooksAuthors with {
    book_ID @(
        Common.Label : 'Book ID',
        Common.Text : book.title,
        Common.TextArrangement : #TextLast // Displays ID next to the title
    );
    author_ID @(
        Common.Label : 'Author ID',
        Common.Text : author.name,
        Common.TextArrangement : #TextLast // Displays ID next to the name
    );
};

// -----------------------------------------------------------
// 2. Value Lists (Dropdowns)
// -----------------------------------------------------------
annotate service.BooksAuthors with {
    book_ID @Common.ValueList: {
        CollectionPath: 'Books',
        Parameters    : [
            { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: book_ID, ValueListProperty: 'ID' },
            { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'title' }
        ],
    };

    author_ID @Common.ValueList: {
        CollectionPath: 'Authors',
        Parameters    : [
            { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: author_ID, ValueListProperty: 'ID' },
            { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'name' }
        ],
    }
};

// -----------------------------------------------------------
// 3. UI Layouts (Tables and Forms configured for 'manage' intents)
// -----------------------------------------------------------
annotate service.BooksAuthors with @UI.HeaderInfo: { 
    TypeName: 'Assigned Author', 
    TypeNamePlural: 'Assigned Authors' 
};

// The Table Columns
annotate service.BooksAuthors with @UI.LineItem: [
    { $Type : 'UI.DataField', Value : book_ID, Label : 'Book ID' },
    { $Type : 'UI.DataField', Value : book.title, Label : 'Book Title' },
    { $Type : 'UI.DataField', Value : author_ID, Label : 'Author ID' },
    { $Type : 'UI.DataField', Value : author.name, Label : 'Author Name' }
];

// 2. FOR AUTHORS APP: Hides the redundant Author columns
annotate service.BooksAuthors with @UI.LineItem #AuthorView: [
    { $Type: 'UI.DataField', Value: book_ID, Label: 'Book ID' },
    { $Type: 'UI.DataField', Value: book.title, Label: 'Book Title' }
];

// 3. FOR BOOKS APP: Hides the redundant Book columns
annotate service.BooksAuthors with @UI.LineItem #BookView: [
    { $Type: 'UI.DataField', Value: author_ID, Label: 'Author ID' },
    { $Type: 'UI.DataField', Value: author.name, Label: 'Author Name' }
];

// The Form Fields (Consolidated to show IDs with links + Text Names)
annotate service.BooksAuthors with @UI.FieldGroup #Main: {
    $Type: 'UI.FieldGroupType', 
    Data: [
        { 
            $Type : 'UI.DataFieldWithIntentBasedNavigation', 
            Label : 'Book ID',
            SemanticObject : 'Book',
            Action : 'manage',
            Value : book_ID
        },
        { 
            $Type : 'UI.DataField', 
            Value : book.title, 
            Label : 'Book Title' 
        },
        { 
            $Type : 'UI.DataFieldWithIntentBasedNavigation', 
            Label : 'Author ID',
            SemanticObject : 'Author',
            Action : 'manage',
            Value : author_ID
        },
        { 
            $Type : 'UI.DataField', 
            Value : author.name, 
            Label : 'Author Name' 
        }
    ]
};

annotate service.BooksAuthors with @UI.Facets: [
    { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate service.BooksAuthors with @UI.SelectionFields: [
    book_ID,
    author_ID
];