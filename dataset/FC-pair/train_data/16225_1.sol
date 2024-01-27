contract c16225{
    // ref per alt
    function tag() public view returns (uint) {
        return uint(pip.read());
    }
}