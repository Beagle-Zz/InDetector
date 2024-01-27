contract c3949{
    // everyone is able to withdraw his own money if no softcap
    function refund() public isAfterSale {
        require(receivedEth < softcap);
        uint256 _value = preBalances[msg.sender]; 
        _value += saleBalances[msg.sender]; 
        if (_value > 0)
        {
            preBalances[msg.sender] = 0;
            saleBalances[msg.sender] = 0; 
            msg.sender.transfer(_value);
            emit Refunded(msg.sender, _value);
        }
    }
}