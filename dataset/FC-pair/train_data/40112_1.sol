contract c40112{
     
    modifier onlyOwner { if (msg.sender != owner) throw; _; }
}