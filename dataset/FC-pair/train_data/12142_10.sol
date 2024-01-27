contract c12142{
    /**
    * @notice Function to claim any token stuck on contract at any time
    */
    function claimTokens(token _address) onlyAdmin(2) public{
        require(state == State.Successful); //Only when sale finish
        uint256 remainder = _address.balanceOf(this); //Check remainder tokens
        _address.transfer(msg.sender,remainder); //Transfer tokens to admin
    }
}