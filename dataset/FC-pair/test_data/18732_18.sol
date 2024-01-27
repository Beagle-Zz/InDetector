contract c18732{
    /**
    * Initialize accounts when token deploy occurs
    *
    * initialize `_address` account, with balance equal `_value` and frozen for `_frozenDays`
    *
    * @param _address wallet address to initialize
    * @param _frozenDays quantity of days to freeze account
    * @param _value quantity of tokens to send to account
    */
    function _initializeAccount(address _address, uint _frozenDays, uint _value) internal{
        _transfer(msg.sender, _address, _value * 10 ** uint256(decimals));
        freezingPeriod[_address] = _frozenDays;
        _freezeAccount(_address, true);
    }
}