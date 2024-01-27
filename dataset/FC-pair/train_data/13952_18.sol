contract c13952{
    // Returns numCards from a uint256 (eg, keccak256) seed hash.
    // Returns cards as one uint, with each card being 6 bits.
    function getCardsFromHash(uint256 _hash, uint _numCards, uint _usedBitmap)
        internal
        pure
        returns (uint _cards)
    {
        // Return early if we don't need to pick any cards.
        if (_numCards == 0) return;
        uint _cardIdx = 0;                // index of currentCard
        uint _card;                       // current chosen card
        uint _usedMask;                   // mask of current card
        while (true) {
            _card = _hash % 52;           // Generate card from hash
            _usedMask = 2**_card;         // Create mask for the card
            // If card is not used, add it to _cards and _usedBitmap
            // Return if we have enough cards.
            if (_usedBitmap & _usedMask == 0) {
                _cards |= (_card * 2**(_cardIdx*6));
                _usedBitmap |= _usedMask;
                _cardIdx++;
                if (_cardIdx == _numCards) return _cards;
            }
            // Generate hash used to pick next card.
            _hash = uint256(keccak256(_hash));
        }
    }
}