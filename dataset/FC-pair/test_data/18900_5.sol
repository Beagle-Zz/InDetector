contract c18900{
    // lps -> {ref,alt}
    function exit(ERC20 gem, uint wad) public note auth {
        require(gem == alt || gem == ref);
        uint jam = (gem == ref) ? wad : wmul(wad, tag());
        uint ink = rmul(jam, per());
        // pay fee to exit, unless you're the last out
        ink = (jam == pie())? ink : wmul(gap, ink);
        lps.pull(msg.sender, ink);
        lps.burn(ink);
        gem.transfer(msg.sender, wad);
    }
}