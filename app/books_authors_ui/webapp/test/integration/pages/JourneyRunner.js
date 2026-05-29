sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"booksauthorsui/test/integration/pages/BooksAuthorsList",
	"booksauthorsui/test/integration/pages/BooksAuthorsObjectPage"
], function (JourneyRunner, BooksAuthorsList, BooksAuthorsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('booksauthorsui') + '/test/flpSandbox.html#booksauthorsui-tile',
        pages: {
			onTheBooksAuthorsList: BooksAuthorsList,
			onTheBooksAuthorsObjectPage: BooksAuthorsObjectPage
        },
        async: true
    });

    return runner;
});

