contract c1889{
    /**
     * @dev Transfers _value amount of tokens to address _to, and MUST fire the Transfer event. 
     * @dev The function SHOULD throw if the _from account balance does not have enough tokens to spend.
     *
     * @dev A token contract which creates new tokens SHOULD trigger a Transfer event with the _from address set to 0x0 when tokens are created.
     *
     * Note Transfers of 0 values MUST be treated as normal transfers and fire the Transfer event.
     *
     * @param _to The receiver of the tokens.
     * @param _value The amount of tokens to send.
     * @return True on success, false otherwise.
     */
    function transfer(address _to, uint256 _value)
    public
    returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0 && balances[_to] + _value > balances[_to]) {
            balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
            balances[_to] = SafeMath.add(balances[_to], _value);
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }
}