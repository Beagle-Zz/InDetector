contract c16365{
    /*
     * @dev Returns BondingManager
     */
    function bondingManager() internal view returns (IBondingManager) {
        return IBondingManager(controller.getContract(keccak256("BondingManager")));
    }
}