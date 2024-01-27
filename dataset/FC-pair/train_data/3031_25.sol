contract c3031{
    /**
    * @dev set allowance for someone to spend tokens from your address
    * @param _spender Address of spender.
    * @param _amount Max amount allowed to spend.
    * @return Whether the approve was successful or not.
    **/
    function approve(address _spender, uint256 _amount) public returns (bool) {
        allowances[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
}