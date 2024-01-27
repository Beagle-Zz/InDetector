contract c18896{
    // {ref,alt} -> lps
    function pool(ERC20 gem, uint wad) public note auth {
        require(gem == alt || gem == ref);
        uint jam = (gem == ref) ? wad : wmul(wad, tag());
        uint ink = rmul(jam, per());
        lps.mint(ink);
        lps.push(msg.sender, ink);
        gem.transferFrom(msg.sender, this, wad);
    }
}