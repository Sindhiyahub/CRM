package com.jspapp.jspapp.Repository;

import com.jspapp.jspapp.dto.Quote;
import java.util.List;

public interface QuoteRepo {
    void addQuote(Quote quote);
    List<Quote> getAllQuotes();
    Quote getQuoteById(int id);
    void updateQuote(Quote quote);
    void deleteQuote(int id);
}

