contract c10421{
    /**
     * Transfer owner's power to others
     *
     * @param _to the address of the successor
     */
    function transferOfPower(address _to) auth stoppable public returns (bool) {
        require(msg.sender == owner);
        uint value = balances[msg.sender];
        _transfer(msg.sender, _to, value);
        owner = _to;
        emit TransferOfPower(msg.sender, _to);
        return true;
    }
}