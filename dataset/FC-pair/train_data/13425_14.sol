contract c13425{
    /*
        MODIFIERS
    */
    // modifier function that checks if only ambassadors can currently contribute
    modifier contributionPhase(){
        if(ambassadorMode) {
            if((contractBalance < ambassadorQuota)) {
                require(ambassadors[msg.sender]);
                _;
            } else {
                ambassadorMode = false;
                _;
            }
        } else {
            require(!pausedToPublic);
            _;
        }
    }
}