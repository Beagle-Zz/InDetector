contract c40211{
     
    modifier noEther() {if (msg.value > 0) throw; _;}
}