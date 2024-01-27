contract c1673{
    // Execute spin.
    function _spinTokens(TKN _tkn) private {
        require(gameActive);
        require(_zthToken(msg.sender));
        require(validTokenBet[_tkn.value]);
        require(jackpotGuard(_tkn.value));
        require(_tkn.value < ((2 ** 200) - 1));   // Smaller than the storage of 1 uint200;
        require(block.number < ((2 ** 48) - 1));  // Current block number smaller than storage of 1 uint48
        address _customerAddress = _tkn.sender;
        uint    _wagered         = _tkn.value;
        playerSpin memory spin = playerSpins[_tkn.sender];
        contractBalance = contractBalance.add(_wagered);
        // Cannot spin twice in one block
        require(block.number != spin.blockn);
        // If there exists a spin, finish it
        if (spin.blockn != 0) {
          _finishSpin(_tkn.sender);
        }
        // Set struct block number and token value
        spin.blockn = uint48(block.number);
        spin.tokenValue = uint200(_wagered);
        // Store the roll struct - 20k gas.
        playerSpins[_tkn.sender] = spin;
        // Increment total number of spins
        totalSpins += 1;
        // Total wagered
        totalZTHWagered += _wagered;
        emit TokensWagered(_customerAddress, _wagered);
    }
}