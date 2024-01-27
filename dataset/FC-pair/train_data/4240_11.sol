contract c4240{
   // Add a user to the whitelist
   function addUser(address user) public nonZeroAddress(user) onlyOwner returns (bool) {
       require(whitelisted[user] == false);
       whitelisted[user] = true;
       emit LogUserAdded(user);
       return true;
    }
}