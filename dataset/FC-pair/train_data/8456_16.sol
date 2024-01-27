contract c8456{
    // Allows some methods to be used by team or robot
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}