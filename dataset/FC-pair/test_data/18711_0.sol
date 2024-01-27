contract c18711{
    // forcetransfer does not do any withdrawals
    function _forceTransfer(address _from, address _to, uint256  _value) internal validAddress {
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }
}