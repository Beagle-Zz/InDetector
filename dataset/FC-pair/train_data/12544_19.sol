contract c12544{
    /**
     * This function allows the owner of the contract to airdrop LMDA tokens 
     * to a list of addresses, so long as a list of values is also provided.
     * 
     * @param _addrs The list of recipient addresses
     * @param _values The number of tokens each address will receive 
     * */
    function airdrop(address[] _addrs, uint256[] _values) public onlyOwner {
        require(lmda.balanceOf(address(this)) >= getSumOfValues(_values));
        require(_addrs.length <= 100 && _addrs.length == _values.length);
        for(uint i = 0; i < _addrs.length; i++) {
            lmda.transfer(_addrs[i], _values[i]);
        }
        AidropInvoked();
    }
}