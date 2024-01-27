contract c16558{
    /*** Owner Action ***/
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}