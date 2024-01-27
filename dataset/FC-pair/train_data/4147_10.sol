contract c4147{
    //////////
    // Safety Methods
    //////////
    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address[] tokens, address to) onlyOwner public {
        if(to == 0x0){
            to = owner;
        }
        address _token;
        uint256 balance;
        uint256 len = tokens.length;
        for(uint256 i; i<len; i++){
            _token = tokens[i];
            if (_token == 0x0) {
                balance = address(this).balance;
                if(balance > 0){
                    to.transfer(balance);
                }
            }else{
                ERC20Token token = ERC20Token(_token);
                balance = token.balanceOf(address(this));
                token.transfer(to, balance);
                emit ClaimedTokens(_token, to, balance);
            }
        }
    }
}