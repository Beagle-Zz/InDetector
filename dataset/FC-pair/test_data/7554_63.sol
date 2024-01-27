contract c7554{
    //@dev for quick overview of approved Tokens
    //@param addressesToCheck are the ERC-20 token addresses to be checked whether they are approved
    function getApprovedAddressesOfList(
        address[] addressToCheck
    )
        external
        view
        returns (bool[])
    {
        uint length = addressToCheck.length;
        bool[] memory isApproved = new bool[](length);
        for (uint i = 0; i < length; i++) {
            isApproved[i] = approvedTokens[addressToCheck[i]];
        }
        return isApproved;
    }
}