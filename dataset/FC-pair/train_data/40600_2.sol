contract c40600{
   
  function calculateROI() internal returns (uint8) {
    if (msg.value <=   1 ether) return 110;  
    if (msg.value <=  10 ether) return 120;  
    if (msg.value <= 100 ether) return 130;  
    return 0;
  }
}