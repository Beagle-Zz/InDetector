contract c18133{
    /// @dev delivery token for buyer
    /// @param a start point
    /// @param b end point
    function deliveryToken(uint a, uint b)
    public
    onlyOwner
    validOriginalBuyPrice
    validRange(a, b) {
        //sumary deposit of investors
        uint256 sum = 0;
        // make sure balances owner greater than _icoSupply
        require(balances[owner] >= _icoSupply);
        for (uint i = a; i <= b; i++){
            if(approvedInvestorList[buyers[i]]) {
                // compute amount token of each buyer
                uint256 requestedUnits = (deposit[buyers[i]] * _originalBuyPrice) / 10**18;
                //check requestedUnits > _icoSupply
                if(requestedUnits <= _icoSupply && requestedUnits > 0 ){
                    // prepare transfer data
                    balances[owner] -= requestedUnits;
                    balances[buyers[i]] += requestedUnits;
                    _icoSupply -= requestedUnits;
                    // submit transfer
                    Transfer(owner, buyers[i], requestedUnits);
                    // reset deposit of buyer
                    sum += deposit[buyers[i]];
                    deposit[buyers[i]] = 0;
                }
            }
        }
        //transfer total ETH of investors to owner
        owner.transfer(sum);
    }
}