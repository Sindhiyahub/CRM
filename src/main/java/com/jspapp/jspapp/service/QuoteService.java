package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.Quote;
import java.util.List;

public interface QuoteService {
    void addQuote(Quote quote);
    List<Quote> getAllQuotes();
    Quote getQuoteById(int id);
    void updateQuote(Quote quote);
    void deleteQuote(int id);
}
