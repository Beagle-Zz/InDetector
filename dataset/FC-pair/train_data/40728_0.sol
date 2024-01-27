contract c40728{
     
    modifier onlyowner { if (msg.sender == owner) _; }
}