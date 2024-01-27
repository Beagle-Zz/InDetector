contract c13397{
    /**
    * @dev Upgrades the implementation address
    * @param version representing the version name of the new implementation to be set
    * @param implementation representing the address of the new implementation to be set
    */
    function _upgradeTo(uint256 version, address implementation) internal {
        require(_implementation != implementation);
        require(version > _version);
        _version = version;
        _implementation = implementation;
        emit Upgraded(version, implementation);
    }
}