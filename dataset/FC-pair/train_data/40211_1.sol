contract c40211{
     
    modifier onlyOwner() { if (msg.sender != owner) throw; _; }
}