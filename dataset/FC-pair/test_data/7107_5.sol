contract c7107{
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0);
        // Prevent transfer to 0x0 address. Use burn() instead
        require(balanceOf[_from] >= _value);
        // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        // Check for overflows
        require(!frozenAccount[_from]);
        // 检查发送人账号是否被冻结
        require(!frozenAccount[_to]);
        // 检查接收人账号是否被冻结
        if (msg.sender.balance < minBalanceForAccounts)
            sell((minBalanceForAccounts - msg.sender.balance) / sellPrice);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        // Subtract from the sender
        balanceOf[_to] = balanceOf[_to].add(_value);
        // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}