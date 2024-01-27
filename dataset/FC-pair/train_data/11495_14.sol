contract c11495{
     /**
      * view the presale end date and time
      **/
     function getPreSaleEndDate() public view onlyOwner returns (uint) {
          return startTime.add(72 days);
     }
}