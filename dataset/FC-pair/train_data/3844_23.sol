contract c3844{
  // retruns true if sale is currently active
    function saleStatus() public view returns (bool){
        return isSaleActive;
    }
}