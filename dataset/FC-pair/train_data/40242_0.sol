contract c40242{
     
    modifier noEther() {if (msg.value > 0) throw; _;}
}