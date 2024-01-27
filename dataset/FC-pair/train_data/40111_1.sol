contract c40111{
     
    modifier onlyOwner { if (msg.sender != owner) throw; _; }
}