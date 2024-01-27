contract c3842{
  //disable if enabled
    function disableSale() onlyOwner() public returns (bool) {
        require(isSaleActive == true);
        isSaleActive = false;
        return true;
    }
}