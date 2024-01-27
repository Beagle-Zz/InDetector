contract c40713{
         
        modifier onlyowner() {
                if (msg.sender == owner) _;
        }
}