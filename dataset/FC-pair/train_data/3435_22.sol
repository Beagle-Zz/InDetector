contract c3435{
    // add to beneficiary mapping in batches
    function _multiMint(address[] _to) internal {
        for(uint i = 0; i < _to.length; i++) {
            mint(_to[i], amount[_to[i]]);
        }
    }
}