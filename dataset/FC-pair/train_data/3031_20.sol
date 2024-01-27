contract c3031{
    /**
    * @dev send tokens without fee
    * @param _from Address of sender.
    * @param _to Address of recipient.
    * @param _amount Amount to send.
    * @return Whether the transfer was successful or not.
    **/
    function noFee(address _from, address _to, uint256 _amount) private returns (bool) {
        require(!tokenFrozen);
        require(balances[_from] >= _amount);
        balances[_to] = balances[_to].add(_amount);
        balances[_from] = balances[_from].sub(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }
}