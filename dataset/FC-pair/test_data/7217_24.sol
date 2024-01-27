contract c7217{
    /**
    * @notice Cancel pending transfer, can only be called by msg.sender == biometricFrom[sha]
    */
    function cancelTransfer(bytes32 sha) public returns (bool){
        require(msg.sender == biometricFrom[sha]);
        require(!biometricCompleted[sha]);
        biometricCompleted[sha] = true;
        return true;
    }
}