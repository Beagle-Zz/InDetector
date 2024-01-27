contract c4690{
    /// starting a new campaign
    function _newCampaign() internal {
        require(!active(), "A campaign is already running!");
        require(_devFraction.add(_charityFraction).add(_jackpotFraction).add(_newCampaignFraction) == ONE_WAD, "Accounting is incorrect!");
        uint _campaignID = campaigns.length++;
        ButtonCampaign storage c = campaigns[_campaignID];
        lastCampaignID = _campaignID;
        c.price = startingPrice;
        c.priceMultiplier = _priceMultiplier;
        c.devFraction = _devFraction;
        c.charityFraction = _charityFraction;
        c.jackpotFraction = _jackpotFraction;
        c.newCampaignFraction = _newCampaignFraction;
        c.deadline = uint64(now.add(_period));
        c.n = _n;
        c.period = _period;
        c.total.name = keccak256(abi.encodePacked("Total", lastCampaignID));//setting the name of the campaign's accaount     
        transferETH(nextCampaign, c.total, nextCampaign.balanceETH);
        emit Started(c.total.balanceETH, _period, lastCampaignID); 
    }
}