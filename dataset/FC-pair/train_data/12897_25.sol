contract c12897{
    /// @dev Removes list of investors from list
    /// @param investorList Array of addresses of investors to be removed
    function removeInvestorList(address[] investorList)
    onlyOwner
    public {
        for (uint256 i = 0; i < investorList.length; i++){
            approvedInvestorList[investorList[i]] = false;
        }
    }
}