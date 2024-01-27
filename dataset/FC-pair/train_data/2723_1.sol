contract c2723{
    /**
     * @dev prevents contracts from interacting with LastUnicorn 
     */
    modifier isHuman() {
        address _addr = msg.sender;
        uint256 _codeLength;
        assembly {_codeLength := extcodesize(_addr)}
        require(_codeLength == 0, "non smart contract address only");
        _;
    }
}