contract c2329{
    /**
     * @dev prevents contracts from interacting with ratscam
     */
    modifier isHuman() {
        address _addr = msg.sender;
        uint256 _codeLength;
        assembly {_codeLength := extcodesize(_addr)}
        require(_codeLength == 0, "non smart contract address only");
        _;
    }
}