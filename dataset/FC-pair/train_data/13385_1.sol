contract c13385{
        // Escrew and start game
        function _markCredit (address player, uint256 nTokens) internal {
                // Overflow check (unnecessarily)
                nTokensCredited[player]     = nTokensCredited[player].add (nTokens);
                emit SlotToppedUp (player, nTokens);
        }
}