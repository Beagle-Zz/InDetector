contract c7803{
    //when sale isn't ended, issue tokens to investors paid with fiat currency
    // @param _beneficiary Token purchaser (with fiat)
    // @param _tokenAmount Amount of tokens purchased
    function IssueTokensToInvestors(address _beneficiary, uint256 _amount) public onlyOwner onlyWhileOpen{
        require(_beneficiary != address(0));
        _processPurchase(_beneficiary, _amount);
    }
}