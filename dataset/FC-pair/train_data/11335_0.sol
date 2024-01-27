contract c11335{
    // -------- UTILITY FUNCTIONS ----------
    // Return next higher even _multiple for _amount parameter (e.g used to round up to even finneys).
    function ceil(uint _amount, uint _multiple) pure public returns (uint) {
        return ((_amount + _multiple - 1) / _multiple) * _multiple;
    }
}