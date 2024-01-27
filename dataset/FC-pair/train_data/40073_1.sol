contract c40073{
     
    modifier onlyOwner { if (msg.sender != owner) throw; _; }
}