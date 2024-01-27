contract c10123{
    // Called off-chain to manage UI state so no gas concerns - also never likely to be more than 50-200ish player contracts
    function allPlayerTokenContracts() external view returns (address[]) {
        uint playerContractCount = totalPlayerTokenContracts();
        address[] memory addresses = new address[](playerContractCount);
        for (uint i = 0; i < playerContractCount; i++) {
            addresses[i] = address(playerTokenContracts_[i]);
        }
        return addresses;
    }
}