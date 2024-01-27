contract c16842{
    /**
   * @dev Throws if called by any account other than the owner.
   */
    modifier onlyFabric() {
        require(fabrics[msg.sender].isActive);
        _;
    }
}