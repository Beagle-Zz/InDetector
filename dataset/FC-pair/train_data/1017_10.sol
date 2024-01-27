contract c1017{
    // Execute spin.
    function _spinTokens(TKN _tkn, uint divRate) 
      private 
      betIsValid(_tkn.value, divRate)
    {
        require(gameActive);
        require(block.number <= ((2 ** 48) - 1));  // Current block number smaller than storage of 1 uint56
        address _customerAddress = _tkn.sender;
        uint    _wagered         = _tkn.value;
        playerSpin memory spin = playerSpins[_tkn.sender];
        // We update the contract balance *before* the spin is over, not after
        // This means that we don't have to worry about unresolved rolls never resolving
        // (we also update it when a player wins)
        addContractBalance(divRate, _wagered);
        // Cannot spin twice in one block
        require(block.number != spin.blockn);
        // If there exists a spin, finish it
        if (spin.blockn != 0) {
          _finishSpin(_tkn.sender);
        }
        // Set struct block number and token value
        spin.blockn = uint48(block.number);
        spin.tokenValue = uint200(_wagered);
        spin.tier = uint8(ZethrTierLibrary.getTier(divRate));
        spin.divRate = divRate;
        // Store the roll struct - 20k gas.
        playerSpins[_tkn.sender] = spin;
        // Increment total number of spins
        totalSpins += 1;
        // Total wagered
        totalZTHWagered += _wagered;
        emit TokensWagered(_customerAddress, _wagered);
    }
}