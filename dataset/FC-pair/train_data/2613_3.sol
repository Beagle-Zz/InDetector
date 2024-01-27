contract c2613{
    // Remove an user from the whitelist
    function removeUser(address user) onlyOwner public {
        whitelisted[user] = false;
        emit LogUserRemoved(user);
    }
}