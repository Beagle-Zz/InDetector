contract c2886{
    // remove an approver
    // only admin can perform this function
    function removeApprover(address oldApprover) external onlyAdmin {
        require(approvers[oldApprover]);
        delete approvers[oldApprover];
        // swap last address with deleted address (for array)
        uint256 length = approverArr.length;
        address swapAddr = approverArr[length - 1];
        for(uint8 i=0; i<length; i++) {
            if(approverArr[i] == oldApprover) {
                approverArr[i] = swapAddr;
                break;
            }
        }
        approverArr.length--;
    }
}