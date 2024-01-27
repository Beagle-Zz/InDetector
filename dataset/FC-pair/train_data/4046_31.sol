contract c4046{
    /**
    * @dev In case of investor transfer, values will be limited by timelock
    * @param _to address to send
    * @param _value tmtg's amount
    */
    function _transferInvestor(address _to, uint256 _value) internal returns (bool ret) {
        uint256 addedValue = searchInvestor[msg.sender]._sentAmount.add(_value);
        require(_timelimitCal(msg.sender) >= addedValue);
        searchInvestor[msg.sender]._sentAmount = addedValue;        
        ret = super.transfer(_to, _value);
        if (!ret) {
        searchInvestor[msg.sender]._sentAmount = searchInvestor[msg.sender]._sentAmount.sub(_value);
        }
    }
}