contract c13952{
    // Both _hand and _draws store the first card in the
    //   rightmost position. _hand uses chunks of 6 bits.
    //
    // In the below example, hand is [9,18,35,12,32], and
    // the cards 18 and 35 will be replaced.
    //
    // _hand:                                [9,18,35,12,32]  
    //    encoding:    XX 100000 001100 100011 010010 001001
    //      chunks:           32     12     35     18      9
    //       order:        card5, card4, card3, card2, card1
    //     decimal:                                540161161
    //
    // _draws:                               card2 and card4
    //    encoding:   XXX      0      0      1      1      0
    //       order:        card5, card4, card3, card2, card1 
    //     decimal:                                        6
    // 
    // Gas Cost: Fixed 6k gas. 
    function drawToHand(uint256 _hash, uint32 _hand, uint _draws)
        public
        pure
        returns (uint32)
    {
        // Draws must be valid. If no hand, must draw all 5 cards.
        assert(_draws <= 31);
        assert(_hand != 0 || _draws == 31);
        // Shortcuts. Return _hand on no draws, or 5 cards on full draw.
        if (_draws == 0) return _hand;
        if (_draws == 31) return uint32(getCardsFromHash(_hash, 5, handToBitmap(_hand)));
        // Create a mask of 1's where new cards should go.
        uint _newMask;
        for (uint _i=0; _i<5; _i++) {
            if (_draws & 2**_i == 0) continue;
            _newMask |= 63 * (2**(6*_i));
        }
        // Create a mask of 0's where new cards should go.
        // Be sure to use only first 30 bits (5 cards x 6 bits)
        uint _discardMask = ~_newMask & (2**31-1);
        // Select from _newHand, discard from _hand, and combine.
        uint _newHand = getCardsFromHash(_hash, 5, handToBitmap(_hand));
        _newHand &= _newMask;
        _newHand |= _hand & _discardMask;
        return uint32(_newHand);
    }
}