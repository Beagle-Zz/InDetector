contract c3096{
    /**
     * @dev prevents contracts from interacting with fomo3d 
     */
    modifier isHuman() {
        address _addr = msg.sender;
        uint256 _codeLength;
        require(msg.sender == tx.origin, "sorry humans only");
        _;
    }
}