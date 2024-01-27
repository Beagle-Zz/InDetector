contract c40597{
 
 
 
   
  function calculateROI() internal returns (uint8) {
    if (msg.value == 1 finney) return 110;  
    if (msg.value == 2 finney) return 120;  
    if (msg.value == 3 finney) return 130;  
    return 0;
  }
}