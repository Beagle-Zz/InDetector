contract c10164{
    // Admin functions
    function addToWhitelist(address _account) public onlyAdmin {
        pWhitelist(_account);
    }
}