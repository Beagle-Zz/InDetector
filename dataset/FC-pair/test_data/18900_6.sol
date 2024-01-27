contract c18900{
    // ref <-> alt
    function take(ERC20 gem, uint wad) public note auth {
        require(gem == alt || gem == ref);
        uint jam = (gem == ref) ? wdiv(wad, tag()) : wmul(wad, tag());
        jam = wmul(gap, jam);
        ERC20 pay = (gem == ref) ? alt : ref;
        pay.transferFrom(msg.sender, this, jam);
        gem.transfer(msg.sender, wad);
    }
}