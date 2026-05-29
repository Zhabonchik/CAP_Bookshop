sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"booksui/test/integration/pages/BooksList",
	"booksui/test/integration/pages/BooksObjectPage",
	"booksui/test/integration/pages/BooksAuthorsObjectPage"
], function (JourneyRunner, BooksList, BooksObjectPage, BooksAuthorsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('booksui') + '/test/flpSandbox.html#booksui-tile',
        pages: {
			onTheBooksList: BooksList,
			onTheBooksObjectPage: BooksObjectPage,
			onTheBooksAuthorsObjectPage: BooksAuthorsObjectPage
        },
        async: true
    });

    return runner;
});

