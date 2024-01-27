contract c16873{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public onlyPayloadSize(2) returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        // Block the sending of tokens from the fund Advisors
        if ((msg.sender == walletAdvisor) && (now < endTimeLockedTokensAdvisor)) {
            revert();
        }
        // Block the sending of tokens from the fund Team
        if((msg.sender == walletTeam) && (now < endTimeLockedTokensTeam)) {
            revert();
        }
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}