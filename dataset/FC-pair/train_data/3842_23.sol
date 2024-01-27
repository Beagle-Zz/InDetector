contract c3842{
  // retruns true if sale is currently active
    function saleStatus() public view returns (bool){
        return isSaleActive;
    }
}