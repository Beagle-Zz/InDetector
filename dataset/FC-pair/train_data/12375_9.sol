contract c12375{
    // disable transfers and allow them once token is tradeable
    function transfer(address _to, uint256 _value) isSetTrading returns (bool success){
        return super.transfer(_to, _value);
    }
}