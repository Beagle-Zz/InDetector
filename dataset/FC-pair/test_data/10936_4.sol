contract c10936{
    //Remove an admin
    function revokeAdminStatus(address user) onlyOwner public {
        admins[user] = false;
    }
}