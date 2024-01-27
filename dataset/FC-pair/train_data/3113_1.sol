contract c3113{
    /**
     * @dev prevents contracts from interacting with fomo3d 
     */
    modifier isHuman() {
        // *breathes in*
        // HAHAHAHA
        //address _addr = msg.sender;
        //uint256 _codeLength;
        //assembly {_codeLength := extcodesize(_addr)}
        //require(_codeLength == 0, "sorry humans only");
        require(msg.sender == tx.origin, "sorry humans only - FOR REAL THIS TIME");
        _;
    }
}