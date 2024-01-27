contract c4690{
    /// The number of presses for the current campaign
    function presses() external view returns(uint) {
        if(active()) {
            return campaigns[lastCampaignID].presses;
        } else {
            return 0;
        }
    }
}