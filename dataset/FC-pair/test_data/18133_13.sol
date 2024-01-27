contract c18133{
    /// @dev check address is approved investor
    /// @param _addr address
    function isApprovedInvestor(address _addr)
    public
    constant
    returns (bool) {
        return approvedInvestorList[_addr];
    }
}