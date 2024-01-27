contract c7543{
    //@dev  getContributorRemainingCap returns remaining cap for a contributor
    //      Assuming that contributor has passed KYC process = is allowed to participate.
    //      If contributor hasn"t participated - it will return full cap according to IEO stage (capped / open / close).
    //      If contributor already participated. when IEO in capped stage, will return contributor cap less previous
    //        participation. if open contribute stage will return max cap.
    //        notice the participation amount will still be blocked by token balance of this contract.
    function getContributorRemainingCap(uint userId) public view returns(uint capWei) {
        if (!IEOStarted()) return 0;
        if (IEOEnded()) return 0;
        if (openIEOStarted()) {
            capWei = MAX_PURCHASE_WEI;
        } else {
            if (participatedWei[userId] >= contributorCapWei) capWei = 0;
            else capWei = contributorCapWei.sub(participatedWei[userId]);
        }
    }
}