contract c4690{
    /// Last presser
    function lastPresser() external view returns(address) {
        return campaigns[lastCampaignID].lastPresser;
    }
}