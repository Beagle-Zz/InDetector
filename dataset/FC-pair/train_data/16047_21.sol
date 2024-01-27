contract c16047{
    /**
    * Airdrops tokens to up to 100 ETH addresses. 
    *
    * @param _addrs The list of addresses to send tokens to
    * @param _values The list of amounts of tokens to send to each corresponding address.
    **/
    function airdrop(address[] _addrs, uint256[] _values) public onlyOwner returns(bool) {
        require(_addrs.length == _values.length && _addrs.length <= 100);
        require(MSTCOIN.balanceOf(address(this)) >= getSumOfValues(_values));
        for (uint i = 0; i < _addrs.length; i++) {
            if (_addrs[i] != 0x0 && _values[i] > 0) {
                MSTCOIN.transfer(_addrs[i], _values[i]);
            }
        }
        AirdropInvoked();
        return true;
    }
}