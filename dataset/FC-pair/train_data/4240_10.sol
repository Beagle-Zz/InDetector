contract c4240{
   /**
    * @dev returns the currently running tier index as per time
    * Return -1 if no tier is running currently
    * */
   function getCurrentlyRunningPhase()public view returns(int8){
      for(uint8 i = 0; i < noOfPhases; i++){
          if(now >= phases[i].startTime && now <= phases[i].endTime){
              return int8(i);
          }
      }   
      return -1;
   }
}