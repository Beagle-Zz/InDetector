contract c10756{
    /**
    * @dev add to white list
    * param addresses the list of address added to white list
    * param weiPerContributor the wei can be transfer per contributor
    * param capWei for the user in this list
    */
    function addToWhiteList(address[] addresses, uint256 weiPerContributor) public onlyOwner {
        for (uint32 i = 0; i < addresses.length; i++) {
            whiteList[addresses[i]] = WhiteListRecord(weiPerContributor, 0);
        }
    }
}