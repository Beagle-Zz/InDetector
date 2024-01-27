contract c7493{
    // @dev the intention is to set the owner as the DX-proxy, once it is deployed
    // Then only an update of the DX-proxy contract after a 30 days delay could change the minter again.
    function updateOwner(   
        address _owner
    )
        public
    {
        require(msg.sender == owner);
        require(_owner != address(0));
        owner = _owner;
    }
}