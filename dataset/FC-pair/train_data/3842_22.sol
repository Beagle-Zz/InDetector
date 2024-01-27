contract c3842{
  // enable if diabled
    function enableSale()  onlyOwner() public returns (bool) {
        require(isSaleActive == false);
        isSaleActive = true;
        return true;
    }
}