contract c40242{
     
    modifier onlyOwner() { if (msg.sender == owner) _; }
}