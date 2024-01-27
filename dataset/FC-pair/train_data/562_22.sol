contract c562{
    /**
    * @dev This method can be used by the owner to extract mistakenly sent tokens
    * or Ether sent to this contract.
    * @param _token address The address of the token contract that you want to
    * recover set to 0 in case you want to extract ether. It can't be ElpisToken.
    */
    function claimTokens(address _token) public onlyOwner {
        require(_token != address(token));
        if (_token == address(0)) {
            owner.transfer(address(this).balance);
            return;
        }
        ERC20 tokenReference = ERC20(_token);
        uint balance = tokenReference.balanceOf(address(this));
        token.transfer(owner, balance);
        emit ClaimedTokens(_token, owner, balance);
    }
}