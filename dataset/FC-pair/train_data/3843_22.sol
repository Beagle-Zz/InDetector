contract c3843{
  // enable if diabled
    function enableSale()  onlyOwner() public returns (bool) {
        require(isSaleActive == false);
        isSaleActive = true;
        return true;
    }
}