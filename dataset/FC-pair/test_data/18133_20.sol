contract c18133{
    /// @dev return ETH for normal buyers in range [a, b]
    /// @param a start point
    /// @param b end point
    function returnETHforUnqualifiedBuyers(uint a, uint b)
    public
    validRange(a, b)
    onlyOwner{
        for(uint i = a; i <= b; i++){
            // buyer not approve investor
            if (!approvedInvestorList[buyers[i]]) {
                // get deposit of buyer
                uint256 buyerDeposit = deposit[buyers[i]];
                // reset deposit of buyer
                deposit[buyers[i]] = 0;
                // return deposit amount for buyer
                buyers[i].transfer(buyerDeposit);
            }
        }
    }
}