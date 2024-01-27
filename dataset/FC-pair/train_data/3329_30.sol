contract c3329{
    /**
     * @dev Checks whether the cap has been reached. 
     * @return Whether the cap was reached
     */
    function tokenCapReached() public view returns (bool) {
      return tokenSold >= totalTokenSaleCap;
    }
}