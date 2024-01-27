contract c18811{
    /**
     * @dev Send tokens to other multi addresses in one function
     *
     * @param _from address The address which you want to send tokens from
     * @param _destAddrs address The addresses which you want to send tokens to
     * @param _values uint256 the amounts of tokens to be sent
     */
    function multiSendFrom(address _from, address[] _destAddrs, uint256[] _values) onlyOwner public returns (uint256) {
        require(_destAddrs.length == _values.length);
        uint256 i = 0;
        for (; i < _destAddrs.length; i = i.add(1)) {
            if (!erc20tk.transferFrom(_from, _destAddrs[i], _values[i])) {
                break;
            }
        }
        return (i);
    }
}