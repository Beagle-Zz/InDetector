contract c8239{
    /**
     * @dev Allows the owner to change the vault address.
     * @param _vault New vault address.
     */
    function changeVault(address _vault) public
    onlyOwner {
        emit VaultChanged(vault, _vault);
        vault = _vault;
    }
}