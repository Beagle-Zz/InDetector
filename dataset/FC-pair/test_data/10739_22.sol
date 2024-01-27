contract c10739{
    /**
     * @dev update the rate
     */
    function updateRate(uint256 rate_) public onlyOwner {
      require(now <= initialTime);
      rate = rate_;
      emit UpdateRate(rate);
    }
}