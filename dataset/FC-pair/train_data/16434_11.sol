contract c16434{
    // Is an account whitelisted?
    function isWhitelisted(address contributor) public view returns (bool) {
        return whitelist[contributor];
    }
}