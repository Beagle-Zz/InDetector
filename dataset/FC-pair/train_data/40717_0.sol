contract c40717{
     
    modifier onlyowner() { if (msg.sender == owner) _; }
}