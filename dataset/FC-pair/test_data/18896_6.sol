contract c18896{
    // ref <-> alt
    // TODO: meme 'swap'?
    // TODO: mem 'yen' means to desire. pair with 'pay'? or 'ney'
    function take(ERC20 gem, uint wad) public note auth {
        require(gem == alt || gem == ref);
        uint jam = (gem == ref) ? wdiv(wad, tag()) : wmul(wad, tag());
        jam = wmul(gap, jam);
        ERC20 pay = (gem == ref) ? alt : ref;
        pay.transferFrom(msg.sender, this, jam);
        gem.transfer(msg.sender, wad);
    }
}