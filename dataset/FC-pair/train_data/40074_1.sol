contract c40074{
     
    modifier onlyOwner { if (msg.sender != owner) throw; _; }
}