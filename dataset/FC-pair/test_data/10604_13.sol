contract c10604{
    /*
        @notice Calculates the optimal per-wallet balance target
        @param target The global target
        @param balances The balance of each account
        @return nTarget The target per account
    */
    function getTargetPerWallet(uint256 target, uint256[] memory balances) internal pure returns (uint256 nTarget) {
        uint256 d = balances.length;
        uint256 oTarget = target / balances.length;
        uint256 t;
        for (uint256 i = 0; i < balances.length; i++) {
            if (balances[i] > oTarget) {
                d--;
                t += (balances[i] - oTarget);
            }
        }
        nTarget = oTarget - (t / d);
    }
}