contract c8910{
    // Add a user to the whitelist
    function addUser(address user) onlyOwner public {
        whitelisted[user] = true;
        emit LogUserAdded(user);
    }
}