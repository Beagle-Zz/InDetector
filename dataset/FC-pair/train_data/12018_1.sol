contract c12018{
    /* Library meta */
    function getVersion() external view returns (uint) {
        // even though this is constant we want to make sure that it's actually
        // callable on Ethereum so we don't accidentally package the constant code
        // in with an SC using BBLib. This function _must_ be external.
        return BB_VERSION;
    }
}