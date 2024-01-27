contract c12597{
   /**
    * @dev Overrides default ERC20
    */
    function transferFrom(address _from, address _to, uint256 _value) public whenSaleFinished returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}