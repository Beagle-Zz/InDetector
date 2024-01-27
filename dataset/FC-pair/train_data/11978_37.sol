contract c11978{
    //when sale has ended, send unsold tokens back to token contract
    // @param _beneficiary Token contract
    function TransferUnsoldTokensBackToTokenContract(address _beneficiary) public onlyOwner {
        require(hasClosed());
        uint256 unSoldTokens = token.balanceOf(address(this)).sub(tokensStillInLockup);
        token.transfer(_beneficiary, unSoldTokens);
    }
}