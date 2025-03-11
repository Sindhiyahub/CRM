
package com.jspapp.jspapp.service;

import com.jspapp.jspapp.dto.MarketingCampaign;
import com.jspapp.jspapp.Repository.MarketingCampaignRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarketingCampaignServiceImpl implements MarketingCampaignService {

    private final MarketingCampaignRepo campaignRepo;

    public MarketingCampaignServiceImpl(MarketingCampaignRepo campaignRepo) {
        this.campaignRepo = campaignRepo;
    }

    @Override
    public void addCampaign(MarketingCampaign campaign) {
        campaignRepo.addCampaign(campaign);
    }

    @Override
    public List<MarketingCampaign> getAllCampaigns() {
        return campaignRepo.getAllCampaigns();
    }

    @Override
    public MarketingCampaign getCampaignById(int id) {
        return campaignRepo.getCampaignById(id);
    }

    @Override
    public void updateCampaign(MarketingCampaign campaign) {
        campaignRepo.updateCampaign(campaign);
    }

    @Override
    public void deleteCampaign(int id) {
        campaignRepo.deleteCampaign(id);
    }
}
