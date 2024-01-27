contract c40350{
   
  modifier noEther() { if (msg.value > 0) throw; _;}
}