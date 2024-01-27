contract c11718{
    /**
     * @dev Returns costs of given tokens amount
     */
    function getTokensCost(uint256 _tokensAmount) public view returns(uint256) {
      return _tokensAmount.div(stageRate());
    }
}