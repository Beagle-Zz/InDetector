contract c12408{
    /**
     * @dev This method contains the core game logic, tracking a distinct button "click" event and 
     * saving all relevant metadata associated with it. This method will generate both a ButtonClick 
     * and Transfer event. Callers can ONLY call this method a single time per game generation.
     *
     * @return the id in our array, which is the latest click
     */
    function clickButton() external isStarted payable returns (uint256) {
        // Avoid spamming the game with a minimum fee
        require(msg.value >= minimumFee);
        // Don't allow the game to be played indefinitely
        require(gameGeneration <= 65535);
        // Require that the user has never click the button previously this round
        require(addressLastClickedForGeneration[msg.sender] < gameGeneration);
        // Immediately bump the user's last button click to this generation
        addressLastClickedForGeneration[msg.sender] = gameGeneration;
        // Ensure that 0 is the effective floor for elapsed blocks
        // Math.max256 won't work due to integer underflow, which will give a huge number if block.number > blockNumberForVictory
        uint256 _blocksAwayFromDesiredBlock;
        if (blockNumberForVictory > block.number) {
            _blocksAwayFromDesiredBlock = blockNumberForVictory - block.number;
        } else {
            _blocksAwayFromDesiredBlock = 0;
        }
        // Keep the local value before possibly incrementing it in the victory condition
        uint256 _generation = gameGeneration;
        // Victory condition!!
        if (_blocksAwayFromDesiredBlock == 0) {
            gameGeneration++;
        }
        // Increment how many clicks have occurred at this number
        numberOfClicksAtBlocksRemaining[uint8(_blocksAwayFromDesiredBlock)] += 1;
        // Update the blockNumber that is required for the next victory condition
        blockNumberForVictory = block.number + requiredBlocksElapsedForVictory;
        // Create a new click
        ButtonClickMetadata memory _click = ButtonClickMetadata({
            blocksAwayFromDesiredBlock: uint64(_blocksAwayFromDesiredBlock),
            clickGeneration: uint64(_generation),
            clickTime: uint64(now)
        });
        uint256 newClickId = clicks.push(_click) - 1;
        // Emit the click event
        emit ButtonClick(msg.sender, newClickId);
        // Formally mint this token and transfer ownership
        _mint(msg.sender, newClickId);
        return newClickId;
    }
}