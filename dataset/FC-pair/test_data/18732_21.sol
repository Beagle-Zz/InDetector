contract c18732{
    /**
    * Internal function to deliver tokens for bounty, pre-ICO or ICO with determined freezing periods
    *
    * @param _from account address to withdraw tokens
    * @param _to account address to send tokens
    * @param _value quantity of tokes to send
    * @param _frozenDays quantity of days to freeze account
    */
    function _tokenDelivery(address _from, address _to, uint _value, uint _frozenDays) internal {
        freezingPeriod[_to] = 0;
        _freezeAccount(_to, false);
        _transfer(_from, _to, _value);
        freezingPeriod[_to] = _frozenDays;
        _freezeAccount(_to, true); 
    }
}