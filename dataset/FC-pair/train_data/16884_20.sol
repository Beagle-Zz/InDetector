contract c16884{
        //forbid transfer before release
        function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
           require(releasedForTransfer);
           return super.transferFrom(_from, _to, _value);
        }
}