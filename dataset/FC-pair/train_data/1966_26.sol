contract c1966{
    /// =======================
    /// ORACLIZE RELATED FUNCTIONS
    // the callback function is called by Oraclize when the result is ready
    // the oraclize_randomDS_proofVerify modifier prevents an invalid proof to execute this function code:
    // the proof validity is fully verified on-chain
    function __callback(bytes32 rollId, string _result, bytes _proof) public {
        require(msg.sender == oraclize_cbAddress(), "Only Oraclize can call this method");
        address player = rollIdToGameAddress[rollId];
        // avoid reorgs
        if (player == address(0)) {
            failedRolls[rollId] = FAILED_ROLE;
            return;
        }
        if (oraclize_randomDS_proofVerify__returnCode(rollId, _result, _proof) != 0) {
            Game storage game = gamesInProgress[player];
            if (game.bet > 0) {
                game.player.transfer(game.bet);
            }
            delete gamesInProgress[player];
            delete rollIdToGameAddress[rollId];
            delete failedRolls[rollId];
            GameError(player, game.id, rollId);
        } else {
            uint8 randomNumber = uint8((uint(keccak256(_result)) % NUM_DICE_SIDES) + 1);
            processDiceRoll(player, randomNumber);
            delete rollIdToGameAddress[rollId];
        }
    }
}