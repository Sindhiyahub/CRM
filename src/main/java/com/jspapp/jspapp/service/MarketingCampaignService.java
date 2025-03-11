package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.MarketingCampaign;
import java.util.List;

public interface MarketingCampaignService {
    void addCampaign(MarketingCampaign campaign);
    List<MarketingCampaign> getAllCampaigns();
    MarketingCampaign getCampaignById(int id);
    void updateCampaign(MarketingCampaign campaign);
    void deleteCampaign(int id);
}
