contract c12479{
    // increase the amount of eth
    function increaseCap(int256 _cap_inc) onlyOwner public {
        require(_cap_inc != 0);
        if (_cap_inc > 0) {
            cap = cap.add(decimal_num.mul(uint256(_cap_inc)));
        } else {
            uint256 _dec = uint256(- 1 * _cap_inc);
            uint256 cap_dec = decimal_num.mul(_dec);
            if (cap_dec >= cap - totalSupply) {
                cap = totalSupply;
            } else {
                cap = cap.sub(cap_dec);
            }
        }
        IncreaseCap(cap, _cap_inc);
    }
}