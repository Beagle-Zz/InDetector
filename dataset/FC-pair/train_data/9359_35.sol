contract c9359{
    /**
     * @dev Sets the authorization for a transfer to occur between the 'from' and
     *      'to' addresses, to expire at the 'expiry' time.
     * @param from The address from which funds would be transferred.
     * @param to The address to which funds would be transferred. This can be
     *           the zero address to allow transfers to any address.
     * @param expiry The epoch time (seconds since 1/1/1970) at which point this
     *               authorization will no longer be valid.
     */
    function set(address from, address to, uint expiry) public onlyController {
        require(from != 0);
        authorizations[from][to] = expiry;
        emit TransferAuthorizationSet(from, to, expiry);
    }
}