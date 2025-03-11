package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.Quote;
import com.jspapp.jspapp.Repository.QuoteRepo;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class QuoteServiceImpl implements QuoteService {

    private final QuoteRepo quoteRepo;

    public QuoteServiceImpl(QuoteRepo quoteRepo) {
        this.quoteRepo = quoteRepo;
    }

    @Override
    public void addQuote(Quote quote) {
        quoteRepo.addQuote(quote);
    }

    @Override
    public List<Quote> getAllQuotes() {
        return quoteRepo.getAllQuotes();
    }

    @Override
    public Quote getQuoteById(int id) {
        return quoteRepo.getQuoteById(id);
    }

    @Override
    public void updateQuote(Quote quote) {
        quoteRepo.updateQuote(quote);
    }

    @Override
    public void deleteQuote(int id) {
        quoteRepo.deleteQuote(id);
    }
}
