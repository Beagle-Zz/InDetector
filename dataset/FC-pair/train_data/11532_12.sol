contract c11532{
    // Allows users to delete their accounts
    function deleteUser() public {
        bytes32 uncasedUserNameHash = addressDirectory[msg.sender];
        require(initialized(uncasedUserNameHash), "No user associated with the sender address.");
        string memory casedUserName = userDirectory[uncasedUserNameHash].casedUserName;
        delete addressDirectory[msg.sender];
        delete userDirectory[uncasedUserNameHash];
        emit UserDeleted(casedUserName);
    }
}