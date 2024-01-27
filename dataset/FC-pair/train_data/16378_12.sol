contract c16378{
    // Is an account whitelisted?
    function isWhitelisted(address contributor) public view returns (bool) {
        return whitelist[contributor];
    }
}