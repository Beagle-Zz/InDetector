contract c7497{
    // @dev allows to set the minter of Magnolia tokens once.
    // @param   _minter the minter of the Magnolia tokens, should be the DX-proxy
    function updateMinter(
        address _minter
    )
        public
    {
        require(msg.sender == owner);
        require(_minter != address(0));
        minter = _minter;
    }
}