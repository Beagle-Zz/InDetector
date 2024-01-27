contract c18900{
    // ref per alt
    function tag() public view returns (uint) {
        return uint(pip.read());
    }
}