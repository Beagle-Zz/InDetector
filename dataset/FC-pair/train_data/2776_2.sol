contract c2776{
    /**
   * @dev Throws if transfersEnabledFlag is false and not owner.
   */
    modifier transfersEnabled() {
        require(transfersEnabledFlag);
        _;
    }
}