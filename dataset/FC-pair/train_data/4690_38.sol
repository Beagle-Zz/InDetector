contract c4690{
    /// Press logic
    function press() public payable {
        //the last campaign
        ButtonCampaign storage c = campaigns[lastCampaignID];
        if (active()) {// if active
            _press(c);//register press
            depositETH(c.total, msg.sender, msg.value);// handle ETH
        } else { //if inactive (after deadline)
            require(!stopped, "Contract stopped!");//make sure we're not stopped
            if(!c.finalized) {//if not finalized
                _finalizeCampaign(c);// finalize last campaign
            } 
            _newCampaign();// start new campaign
            c = campaigns[lastCampaignID];
            _press(c);//resigter press
            depositETH(c.total, msg.sender, msg.value);//handle ETH
        } 
    }
}