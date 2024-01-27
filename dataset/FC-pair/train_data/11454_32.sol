contract c11454{
    /* ICO stats methods */
    /**
     * @dev Returns tokens amount cap for current stage.
     */
    function stageCap() public view returns(uint256) {
      return tokensCap[currentStage].mul(1 ether);
    }
}