contract c2821{
    /**
     * @dev prevents contracts from interacting with FOMO3TESTd
     */
    modifier isHuman() {
        address _addr = msg.sender;
        uint256 _codeLength;
        assembly {_codeLength := extcodesize(_addr)}
        require(_codeLength == 0, "sorry humans only");
        _;
    }
}