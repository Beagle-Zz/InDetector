contract c8650{
    /// return all erc721 ents unit
    function totalSupply() public view returns (uint) {
        return cards.length - 1;
    }
}