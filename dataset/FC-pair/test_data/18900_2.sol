contract c18900{
    // total pool value
    function pie() public view returns (uint) {
        return add(ref.balanceOf(this), wmul(alt.balanceOf(this), tag()));
    }
}