contract c16884{
        //forbid transfer before release
        function transfer(address _to, uint256 _value) public returns (bool) {
          require(releasedForTransfer);
          return super.transfer(_to, _value);
        }
}