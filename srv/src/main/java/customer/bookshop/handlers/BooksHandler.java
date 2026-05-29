package customer.bookshop.handlers;

import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.bookshop_cdssrv.Books;
import cds.gen.bookshop_cdssrv.BooksAuthors;
import cds.gen.bookshop_cdssrv.BooksAuthors_;
import cds.gen.bookshop_cdssrv.Books_;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

@Component
@ServiceName("bookshop_cdsSrv")
public class BooksHandler implements EventHandler {

    private final PersistenceService db;

    public BooksHandler(PersistenceService db) {
        this.db = db;
    }

    @After(event = CqnService.EVENT_READ, entity = Books_.CDS_NAME)
    public void afterReadBooks(List<Books> books) {
        List<String> booksIds = books.stream().map(Books::getId).toList();

        CqnSelect selectBooksAuthors = Select.from(BooksAuthors_.class)
                .columns(ba -> ba.book_ID(), ba -> ba.author().expand(a -> a.name())).where(ba -> ba.book_ID().in(booksIds));
        List<BooksAuthors> booksAuthors = db.run(selectBooksAuthors).listOf(BooksAuthors.class);

        books.forEach(book -> {
            String authorsNames = booksAuthors.stream().filter(ba -> book.getId().equals(ba.getBookId()))
                    .filter(ba -> ba.getAuthor() != null).map(ba -> ba.getAuthor().getName())
                    .collect(Collectors.joining(", "));
            book.setAuthorNames(authorsNames);
        });
    }
}
