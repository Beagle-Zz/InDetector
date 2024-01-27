contract c7217{
    /**
    * @notice Complete pending Approval, can only be called by msg.sender if it is the originator of Approval
    */
    function releaseApprove(bytes32 sha, uint8 v, bytes32 r, bytes32 s) public returns (bool){
        require(msg.sender == biometricFrom[sha]);
        require(!biometricCompleted[sha]);
        bytes32 approveSha = keccak256("approve", biometricFrom[sha], biometricTo[sha], biometricAmount[sha], biometricNow[sha]);
        bytes32 increaseApprovalSha = keccak256("increaseApproval", biometricFrom[sha], biometricTo[sha], biometricAmount[sha], biometricNow[sha]);
        bytes32 decreaseApprovalSha = keccak256("decreaseApproval", biometricFrom[sha], biometricTo[sha], biometricAmount[sha], biometricNow[sha]);
        require(approveSha == sha || increaseApprovalSha == sha || decreaseApprovalSha == sha);
        require(verify(sha, v, r, s) == true);
        super.approve(biometricTo[sha], biometricAmount[sha]);
        biometricCompleted[sha] = true;
        return true;
    }
}