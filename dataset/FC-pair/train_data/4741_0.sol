contract c4741{
    /* ERC20 Functions */
    /* Return current supply in smallest denomination (1MGO = 100000000) */
    function totalSupply() constant returns (uint256 totalSupply) {
        return _initialSupply;
    }
}