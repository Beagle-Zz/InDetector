contract c18896{
    // ref per alt
    function tag() public view returns (uint) {
        return uint(pip.read());
    }
}