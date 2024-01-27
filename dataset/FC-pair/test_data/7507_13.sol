contract c7507{
    ///Requires the token sale to have closed
    function transfer(address _to, uint256 _value) public returns (bool) {
        if(!saleClosed) return false;
        return super.transfer(_to, _value);
    }
}