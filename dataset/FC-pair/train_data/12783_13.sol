contract c12783{
   /// @notice Public function to check if the crowdsale has started or not
   function hasStarted() public constant returns(bool) {
      return now > startTime;
   }
}