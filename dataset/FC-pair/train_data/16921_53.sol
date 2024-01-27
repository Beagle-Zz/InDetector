contract c16921{
    /// @dev Check if given mom and dad are a valid mating pair.
    function _canPairMate(
        Cutie storage _mom,
        uint40 _momId,
        Cutie storage _dad,
        uint40 _dadId
    )
        private
        view
        returns(bool)
    {
        // A Cutie can't breed with itself.
        if (_dadId == _momId) { 
            return false; 
        }
        // Cuties can't breed with their parents.
        if (_mom.momId == _dadId) {
            return false;
        }
        if (_mom.dadId == _dadId) {
            return false;
        }
        if (_dad.momId == _momId) {
            return false;
        }
        if (_dad.dadId == _momId) {
            return false;
        }
        // We can short circuit the sibling check (below) if either cat is
        // gen zero (has a mom ID of zero).
        if (_dad.momId == 0) {
            return true;
        }
        if (_mom.momId == 0) {
            return true;
        }
        // Cuties can't breed with full or half siblings.
        if (_dad.momId == _mom.momId) {
            return false;
        }
        if (_dad.momId == _mom.dadId) {
            return false;
        }
        if (_dad.dadId == _mom.momId) {
            return false;
        }
        if (_dad.dadId == _mom.dadId) {
            return false;
        }
        if (geneMixer.canBreed(_momId, _mom.genes, _dadId, _dad.genes)) {
            return true;
        }
        return false;
    }
}