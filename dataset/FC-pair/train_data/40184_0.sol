contract c40184{
   
   
  modifier noEther() {if (msg.value > 0) throw; _;}
}