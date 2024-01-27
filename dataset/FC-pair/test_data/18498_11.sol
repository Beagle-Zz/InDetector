contract c18498{
    /**
     * Peterson's Law Protection
     * Claim tokens
     */
    function claimTokens(address _token) public onlyOwner {
        //function claimTokens(address _token) public {  //for test
        if (_token == 0x0) {
            owner.transfer(this.balance);
            return;
        }
        MintableToken token = MintableToken(_token);
        uint256 balance = token.balanceOf(this);
        token.transfer(owner, balance);
        Transfer(_token, owner, balance);
    }
}