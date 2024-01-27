contract c40452{
     
    modifier onlyowner() { if (msg.sender == owner) _; }
}