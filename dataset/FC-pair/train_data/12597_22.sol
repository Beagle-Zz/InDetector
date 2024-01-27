contract c12597{
   /**
    * @dev Overrides default ERC20
    */
    function transfer(address _to, uint256 _value) public whenSaleFinished returns (bool) {
        return super.transfer(_to, _value);
    }
}