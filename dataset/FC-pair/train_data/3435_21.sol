contract c3435{
    // INTERNAL INTERFACE
    // add to beneficiary mapping in batches
    function _multiSet(address[] _to, uint256[] _amount) internal {
        for (uint i = 0; i < _to.length; i++) {
            amount[_to[i]] = _amount[i];
        }
    }
}