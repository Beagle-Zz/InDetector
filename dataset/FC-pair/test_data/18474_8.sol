contract c18474{
    // Allows unofficial users to delete their account
    function deleteUser(string userName) public {
        bytes32 userNameHash = keccak256(userName);
        require(userNameHashTaken(userNameHash));
        address userAddress = userDirectory[userNameHash].userAddress;
        require(userAddress == msg.sender);
        delete userDirectory[userNameHash];
        emit UserDeleted(userName, userAddress, true);
    }
}