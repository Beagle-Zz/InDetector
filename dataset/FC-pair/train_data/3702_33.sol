contract c3702{
    /**
    * @dev If investor is from in transforFrom, values will be limited by timelock
    * @param _from send amount from this address 
    * @param _to address to send
    * @param _value tmtg's amount
    */
    function _transferFromInvestor(address _from, address _to, uint256 _value)
    public returns(bool ret) {
        uint256 addedValue = searchInvestor[_from]._sentAmount.add(_value);
        require(_timelimitCal(_from) >= addedValue);
        searchInvestor[_from]._sentAmount = addedValue;
        ret = super.transferFrom(_from, _to, _value);
        if (!ret) {
            searchInvestor[_from]._sentAmount = searchInvestor[_from]._sentAmount.sub(_value);
        }else {
            emit TMTG_TransferFrom(_from, msg.sender, _to, _value);
        }
    }
}