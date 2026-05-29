sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"authorsui/test/integration/pages/AuthorsList",
	"authorsui/test/integration/pages/AuthorsObjectPage",
	"authorsui/test/integration/pages/BooksAuthorsObjectPage"
], function (JourneyRunner, AuthorsList, AuthorsObjectPage, BooksAuthorsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('authorsui') + '/test/flpSandbox.html#authorsui-tile',
        pages: {
			onTheAuthorsList: AuthorsList,
			onTheAuthorsObjectPage: AuthorsObjectPage,
			onTheBooksAuthorsObjectPage: BooksAuthorsObjectPage
        },
        async: true
    });

    return runner;
});

