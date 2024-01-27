contract c18133{
    /// @dev Adds list of new investors to the investors list and approve all
    /// @param newInvestorList Array of new investors addresses to be added
    function addInvestorList(address[] newInvestorList)
    onlyOwner
    public {
        for (uint i = 0; i < newInvestorList.length; i++){
            approvedInvestorList[newInvestorList[i]] = true;
        }
    }
}