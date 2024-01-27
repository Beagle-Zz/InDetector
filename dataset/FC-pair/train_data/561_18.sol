contract c561{
    /**
    * @dev This method can be used by the owner to extract mistakenly sent tokens
    * or Ether sent to this contract.
    * @param _token address The address of the token contract that you want to
    * recover set to 0 in case you want to extract ether.
    */
    function claimTokens(address _token) public onlyOwner {
        if (_token == address(0)) {
            owner.transfer(address(this).balance);
            return;
        }
        ERC20 token = ERC20(_token);
        uint balance = token.balanceOf(address(this));
        token.transfer(owner, balance);
        emit ClaimedTokens(_token, owner, balance);
    }
}