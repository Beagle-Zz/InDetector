contract c40482{
     
     
    modifier noEther() {if (msg.value > 0) throw; _;}
}