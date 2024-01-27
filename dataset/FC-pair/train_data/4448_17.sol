contract c4448{
    /**
    * Limit token transfer until the crowdsale is over.    
    */
    modifier canTransfer(address _sender) {
        if(!released) {
            if(!transferAgents[_sender]) {
                revert("The token is in the locking period");
            }
        }
        else if (!releasedTeam && teamMembers[_sender])
        {
            revert("Team members/advisors cannot trade during this period.");
        }    
        _;
    }
}