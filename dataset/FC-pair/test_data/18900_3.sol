contract c18900{
    // lps per ref
    function per() public view returns (uint) {
        return lps.totalSupply() == 0
             ? RAY
             : rdiv(lps.totalSupply(), pie());
    }
}