contract c11495{
     /**
      * view the ICO end date and time
      **/
     function getICOEndDate() public view onlyOwner returns (uint) {
          return startTime.add(112 days);
     }
}