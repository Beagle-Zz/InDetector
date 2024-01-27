contract c3843{
  //disable if enabled
    function disableSale() onlyOwner() public returns (bool) {
        require(isSaleActive == true);
        isSaleActive = false;
        return true;
    }
}